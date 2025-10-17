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

# Clean up any existing containers and networks to avoid conflicts
echo "🧹 Cleaning up existing containers..."
$COMPOSE_CMD down 2>/dev/null || true

# Start the FHIR server and dependencies
echo "🚀 Starting FHIR server and dependencies..."
$COMPOSE_CMD up -d blaze blaze-init

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

# Run the measure evaluation with retry logic
echo "📊 Running measure evaluation..."
MAX_RETRIES=3
RETRY_COUNT=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    echo "🔄 Attempt $((RETRY_COUNT + 1)) of $MAX_RETRIES..."
    
    if $COMPOSE_CMD --profile evaluation up --build measure-evaluator; then
        echo "✅ Measure evaluation completed successfully!"
        break
    else
        RETRY_COUNT=$((RETRY_COUNT + 1))
        if [ $RETRY_COUNT -lt $MAX_RETRIES ]; then
            echo "⚠️  Evaluation failed, retrying in 5 seconds..."
            # Clean up the failed container and network
            $COMPOSE_CMD --profile evaluation down 2>/dev/null || true
            sleep 5
        else
            echo "❌ Evaluation failed after $MAX_RETRIES attempts"
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