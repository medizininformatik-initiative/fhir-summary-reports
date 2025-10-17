#!/bin/bash

# FHIR Measure Evaluation Script (Container Version)
# This script evaluates measures and saves the MeasureReport resources
# Designed to run inside a Docker container

# Configuration
BASE_URL="http://blaze:8080/fhir"  # Using container network
OUTPUT_DIR="/app/output"           # Container output directory
PERIOD_START="1900"
PERIOD_END="2025"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if server is running
check_server() {
    print_status "Checking if FHIR server is running..."
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if curl -s -f "${BASE_URL}/metadata" > /dev/null 2>&1; then
            print_status "FHIR server is running ✓"
            
            # Additional check: verify measures are available
            print_status "Verifying measures are available..."
            local measures_available=$(curl -s "${BASE_URL}/Measure?_summary=count" 2>/dev/null | jq -r '.total // 0' 2>/dev/null || echo "0")
            
            if [ "$measures_available" -gt "0" ]; then
                print_status "Found $measures_available measures ✓"
                return 0
            else
                print_status "No measures found yet, waiting..."
            fi
        fi
        
        print_status "Waiting for FHIR server and data... (attempt $attempt/$max_attempts)"
        sleep 3
        attempt=$((attempt + 1))
    done
    
    print_error "FHIR server at ${BASE_URL} is not responding after ${max_attempts} attempts"
    print_error "Please check if the Blaze FHIR server is running and data is loaded"
    exit 1
}

# Function to evaluate a measure
evaluate_measure() {
    local measure_id="$1"
    local output_file="$2"
    local full_url="${BASE_URL}/Measure/${measure_id}/\$evaluate-measure?periodStart=${PERIOD_START}&periodEnd=${PERIOD_END}"
    
    print_status "Evaluating measure: ${measure_id}"
    print_status "URL: ${full_url}"
    
    # Make the request and save response
    local response=$(curl -s -w "\n%{http_code}" "${full_url}")
    local http_code=$(echo "$response" | tail -n1)
    local json_response=$(echo "$response" | sed '$d')
    
    if [ "$http_code" -eq 200 ]; then
        # Create output directory if it doesn't exist
        mkdir -p "${OUTPUT_DIR}"
        
        # Pretty print the JSON and save to file
        echo "$json_response" | jq '.' > "${OUTPUT_DIR}/${output_file}"
        print_status "Successfully saved MeasureReport to: ${OUTPUT_DIR}/${output_file} ✓"
        
        # Extract and display summary information
        local total_population=$(echo "$json_response" | jq -r '.group[0].population[0].count // "N/A"')
        local stratifier_count=$(echo "$json_response" | jq -r '.group[0].stratifier | length // 0')
        print_status "  → Total population: ${total_population}"
        print_status "  → Number of stratifiers: ${stratifier_count}"
        
    else
        print_error "Failed to evaluate measure ${measure_id}"
        print_error "HTTP Status: ${http_code}"
        print_error "Response: ${json_response}"
        return 1
    fi
}

# Main execution
main() {
    echo "=================================================="
    echo "  FHIR Measure Evaluation Script (Container)"
    echo "=================================================="
    echo ""
    
    # Test basic network connectivity first with retry
    print_status "Testing network connectivity..."
    local network_attempts=20
    local network_attempt=1
    
    while [ $network_attempt -le $network_attempts ]; do
        if curl -s --connect-timeout 5 --max-time 10 http://blaze:8080 > /dev/null 2>&1; then
            print_status "Network connectivity OK ✓"
            break
        fi
        
        if [ $network_attempt -eq $network_attempts ]; then
            print_error "Cannot connect to blaze server after $network_attempts attempts"
            print_error "Container networking may not be properly configured"
            print_error "Trying to diagnose network issues..."
            
            # Network diagnostics
            print_status "Network diagnostic information:"
            echo "Hostname resolution test:"
            nslookup blaze 2>/dev/null || echo "  nslookup failed"
            echo "Network interfaces:"
            ip route 2>/dev/null | head -5 || echo "  ip route failed"
            echo "Ping test:"
            ping -c 2 blaze 2>/dev/null || echo "  ping failed"
            
            exit 1
        fi
        
        print_status "Waiting for network... (attempt $network_attempt/$network_attempts)"
        sleep 2
        network_attempt=$((network_attempt + 1))
    done
    
    # Check server connectivity and data availability
    check_server
    
    echo ""
    print_status "Starting measure evaluations..."
    echo ""
    
    # Evaluate first measure (separate stratifiers)
    evaluate_measure "mii-msr-summary-report-age-gender-cql" "MeasureReport-age-gender-separate.json"
    
    echo ""
    
    # Evaluate second measure (composite stratifier)
    evaluate_measure "mii-msr-summary-report-composite-gender-age-cql" "MeasureReport-age-gender-composite.json"
    
    echo ""
    echo "=================================================="
    print_status "Measure evaluation completed!"
    print_status "Reports saved in: ${OUTPUT_DIR}/"
    echo "=================================================="
    
    # List generated files
    if ls "${OUTPUT_DIR}"/MeasureReport-*.json 1> /dev/null 2>&1; then
        echo ""
        print_status "Generated MeasureReport files:"
        ls -la "${OUTPUT_DIR}"/MeasureReport-*.json
    fi
}

# Run main function
main "$@"