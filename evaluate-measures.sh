#!/bin/bash

# FHIR Measure Evaluation Script
# This script evaluates measures and saves the MeasureReport resources

# Configuration
BASE_URL="http://localhost:8080/fhir"
OUTPUT_DIR="./resources"
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
    if ! curl -s -f "${BASE_URL}/metadata" > /dev/null; then
        print_error "FHIR server at ${BASE_URL} is not responding"
        print_error "Please make sure the server is running with: docker-compose up"
        exit 1
    fi
    print_status "FHIR server is running ✓"
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
    echo "  FHIR Measure Evaluation Script"
    echo "=================================================="
    echo ""
    
    # Check prerequisites
    if ! command -v curl &> /dev/null; then
        print_error "curl is required but not installed"
        exit 1
    fi
    
    if ! command -v jq &> /dev/null; then
        print_warning "jq is not installed - JSON output will not be formatted"
        print_warning "Install jq with: brew install jq (macOS) or apt-get install jq (Ubuntu)"
    fi
    
    # Create output directory if it doesn't exist
    mkdir -p "${OUTPUT_DIR}"
    
    # Check server connectivity
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