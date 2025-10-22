#!/bin/bash

# Cross-platform FHIR Measure Evaluation using Docker
# This script works on Windows (with WSL/Git Bash), macOS, and Linux

echo "=================================================="
echo "  FHIR Measure Evaluation (Docker)"
echo "=================================================="
echo ""

# Check if Docker is available
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed or not in PATH"
    echo "Please install Docker from: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check if Docker Compose is available
if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null 2>&1; then
    echo "❌ Docker Compose is not available"
    echo "Please install Docker Compose or update to Docker Desktop with integrated compose"
    exit 1
fi

# Use docker compose (new syntax) if available, otherwise docker-compose
if docker compose version &> /dev/null 2>&1; then
    COMPOSE_CMD="docker compose"
else
    COMPOSE_CMD="docker-compose"
fi

echo "🐳 Using: $COMPOSE_CMD"
echo ""

# Pre-flight checks
echo "🔍 Running pre-flight checks..."

# Check if docker-compose.yaml exists and is valid
if [ ! -f "docker-compose.yaml" ]; then
    echo "❌ docker-compose.yaml not found in current directory"
    exit 1
fi

# Validate compose file
if ! $COMPOSE_CMD config >/dev/null 2>&1; then
    echo "❌ docker-compose.yaml validation failed"
    echo "   Run '$COMPOSE_CMD config' to see errors"
    exit 1
fi

# Check if required services are defined
if ! $COMPOSE_CMD config --services | grep -q "blaze"; then
    echo "❌ Required service 'blaze' not found in docker-compose.yaml"
    exit 1
fi

echo "✅ Pre-flight checks passed"
echo ""

# Clean up any existing containers and networks to avoid conflicts
echo "🧹 Cleaning up existing containers..."
$COMPOSE_CMD down 2>/dev/null || true

# Ensure Docker daemon is responsive
echo "🔍 Verifying Docker daemon..."
if ! docker system df >/dev/null 2>&1; then
    echo "❌ Docker daemon not responding"
    exit 1
fi

# Force network cleanup and recreation
echo "🌐 Ensuring clean Docker network state..."
$COMPOSE_CMD down -v 2>/dev/null || true
docker network prune -f >/dev/null 2>&1

# Start the FHIR server and dependencies
echo "🚀 Starting FHIR server and dependencies..."
$COMPOSE_CMD up -d blaze blaze-init

# Wait for Docker to establish network properly
echo "⏳ Allowing Docker network to stabilize..."
sleep 5

# Verify network exists before proceeding with retries
echo "🔍 Verifying Docker network is ready..."
NETWORK_RETRIES=0
while [ $NETWORK_RETRIES -lt 5 ]; do
    NETWORK_NAME=$(docker network ls --filter name=fhir-summary-reports --format "{{.Name}}" | head -1)
    if [ -n "$NETWORK_NAME" ]; then
        echo "✅ Network found: $NETWORK_NAME"
        break
    fi
    echo "⚠️  Network not found, waiting... (attempt $((NETWORK_RETRIES + 1))/5)"
    sleep 3
    NETWORK_RETRIES=$((NETWORK_RETRIES + 1))
done

if [ $NETWORK_RETRIES -eq 5 ]; then
    echo "❌ Network creation failed after 5 attempts"
    echo "🛠️  Trying manual network creation..."
    $COMPOSE_CMD down
    $COMPOSE_CMD up -d blaze blaze-init
    sleep 5
fi

# Wait for services to be ready and data to be uploaded
echo "⏳ Waiting for services to initialize and data upload..."
echo "   This may take 15-30 seconds for first-time setup..."
sleep 15

# Additional check: ensure blaze is responding before proceeding
echo "🔍 Verifying FHIR server is ready..."
MAX_WAIT=30
WAIT_COUNT=0
while [ $WAIT_COUNT -lt $MAX_WAIT ]; do
    if curl -s -f "http://localhost:8080/fhir/metadata" >/dev/null 2>&1; then
        echo "✅ FHIR server is responding on host"
        break
    fi
    echo "   Waiting for FHIR server... ($((WAIT_COUNT + 1))/$MAX_WAIT)"
    sleep 2
    WAIT_COUNT=$((WAIT_COUNT + 1))
done

if [ $WAIT_COUNT -eq $MAX_WAIT ]; then
    echo "❌ FHIR server not responding after ${MAX_WAIT} attempts"
    echo "   Checking container status..."
    $COMPOSE_CMD ps blaze
    exit 1
fi

# Check if blaze-init completed successfully
echo "📋 Checking data upload status..."
if $COMPOSE_CMD ps blaze-init | grep -q "Exited (0)"; then
    echo "✅ Data upload completed successfully"
else
    echo "⏳ Waiting for data upload to complete..."
    sleep 5
fi

# Give the network a moment to fully stabilize
echo "🌐 Allowing network to stabilize..."
sleep 3

# Pre-build the measure evaluator container while network is stable
echo "🔨 Building measure evaluator container..."
if ! $COMPOSE_CMD build measure-evaluator; then
    echo "❌ Failed to build measure evaluator container"
    exit 1
fi
echo "✅ Container built successfully"

# Run the measure evaluation with robust retry logic
echo "📊 Running measure evaluation..."
MAX_RETRIES=3
RETRY_COUNT=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    echo "🔄 Attempt $((RETRY_COUNT + 1)) of $MAX_RETRIES..."
    
    # Verify network and containers are still running before attempt
    if [ $RETRY_COUNT -gt 0 ]; then
        echo "🔍 Pre-attempt verification..."
        
        # Check if network still exists
        NETWORK_NAME=$(docker network ls --filter name=fhir-summary-reports --format "{{.Name}}" | head -1)
        if [ -z "$NETWORK_NAME" ]; then
            echo "⚠️  Network missing, recreating services..."
            $COMPOSE_CMD down 2>/dev/null || true
            $COMPOSE_CMD up -d blaze blaze-init
            sleep 10
        fi
        
        # Verify blaze is still running
        if ! curl -s -f "http://localhost:8080/fhir/metadata" >/dev/null 2>&1; then
            echo "⚠️  FHIR server not responding, restarting..."
            $COMPOSE_CMD restart blaze
            sleep 10
        fi
    fi
    
    # Force recreation of the measure-evaluator container to get fresh network references
    if $COMPOSE_CMD --profile evaluation up --no-build --force-recreate measure-evaluator; then
        echo "✅ Measure evaluation completed successfully!"
        break
    else
        RETRY_COUNT=$((RETRY_COUNT + 1))
        if [ $RETRY_COUNT -lt $MAX_RETRIES ]; then
            echo "⚠️  Evaluation failed, retrying in 10 seconds..."
            # Clean up the failed container
            $COMPOSE_CMD --profile evaluation down 2>/dev/null || true
            sleep 10
        else
            echo "❌ Evaluation failed after $MAX_RETRIES attempts"
            echo "🔍 Final diagnosis:"
            echo "   Network status:"
            docker network ls --filter name=fhir-summary-reports
            echo "   Container status:"
            $COMPOSE_CMD ps
        fi
    fi
done

# Show the results
echo ""
echo "=================================================="
echo "✅ Evaluation completed!"
echo "=================================================="
echo ""

if [ -d "./resources" ] && ls ./resources/MeasureReport-*.json 1> /dev/null 2>&1; then
    echo "📄 Generated MeasureReport files:"
    ls -la ./resources/MeasureReport-*.json
    echo ""
    echo "💡 Files are saved in ./resources/ directory"
else
    echo "⚠️  No MeasureReport files found in ./resources/"
fi

echo ""
echo "🛑 To stop all services, run:"
echo "   $COMPOSE_CMD down"