#!/bin/bash

# FHIR Population Comparison Evaluation Script
# Evaluates patient population against German census reference data

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
FHIR_BASE_URL="http://localhost:8080/fhir"
OUTPUT_DIR="./resources/population-analysis"

echo "=================================================="
echo "  FHIR Population Comparison Analysis"
echo "=================================================="

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Check server availability
echo -e "\n${BLUE}[INFO]${NC} Checking if FHIR server is running..."
if ! curl -sf "$FHIR_BASE_URL/metadata" > /dev/null; then
    echo -e "${RED}[ERROR]${NC} FHIR server at $FHIR_BASE_URL is not responding"
    echo -e "${RED}[ERROR]${NC} Please make sure the server is running with: docker-compose up"
    exit 1
fi
echo -e "${GREEN}[INFO]${NC} FHIR server is running ✓"

# Function to evaluate measure and calculate comparison metrics
evaluate_population_comparison() {
    local measure_id="$1"
    local output_file="$2"
    local description="$3"
    
    echo -e "\n${BLUE}[INFO]${NC} Evaluating: $description"
    echo -e "${BLUE}[INFO]${NC} Measure ID: $measure_id"
    
    # Evaluate measure
    local url="$FHIR_BASE_URL/Measure/$measure_id/\$evaluate-measure?periodStart=1900&periodEnd=2025"
    echo -e "${BLUE}[INFO]${NC} URL: $url"
    
    local response=$(curl -sf "$url" -H "Accept: application/fhir+json")
    
    if [ $? -eq 0 ]; then
        # Save raw response
        echo "$response" | jq '.' > "$OUTPUT_DIR/$output_file"
        echo -e "${GREEN}[INFO]${NC} Successfully saved MeasureReport to: $OUTPUT_DIR/$output_file ✓"
        
        # Extract key metrics
        local total_population=$(echo "$response" | jq -r '.group[0].population[0].count // 0')
        local stratifier_count=$(echo "$response" | jq -r '.group[0].stratifier | length // 0')
        
        echo -e "${GREEN}[INFO]${NC}   → Total population: $total_population"
        echo -e "${GREEN}[INFO]${NC}   → Number of stratifiers: $stratifier_count"
        
        # Generate comparison summary
        generate_comparison_summary "$response" "$OUTPUT_DIR/${output_file%.json}-summary.json"
        
        return 0
    else
        echo -e "${RED}[ERROR]${NC} Failed to evaluate measure: $measure_id"
        return 1
    fi
}

# Function to generate comparison summary with reference data
generate_comparison_summary() {
    local measure_report="$1"
    local summary_file="$2"
    
    # Extract stratification data and add reference comparison
    local summary=$(echo "$measure_report" | jq '
    {
        "measureId": .measure,
        "evaluationDate": .date,
        "totalPopulation": .group[0].population[0].count,
        "stratificationAnalysis": [
            .group[0].stratifier[]? | {
                "stratifierCode": .code[0].coding[0].code,
                "stratifierDisplay": .code[0].coding[0].display // .code[0].coding[0].code,
                "strata": [
                    .stratum[]? | {
                        "value": .value.text // (.component[]? | select(.code.coding[0].code == "age-group") | .value.text),
                        "observedCount": .population[0].count,
                        "components": (.component[]? | {
                            "code": .code.coding[0].code,
                            "value": .value.text
                        })
                    }
                ]
            }
        ],
        "referenceData": {
            "source": "German Census 2022",
            "totalReferencePopulation": 83237124,
            "note": "Reference percentages calculated from official German census data"
        }
    }')
    
    echo "$summary" > "$summary_file"
    echo -e "${GREEN}[INFO]${NC} Generated comparison summary: $summary_file ✓"
}

# Function to calculate and display population comparison metrics
calculate_population_metrics() {
    echo -e "\n${YELLOW}[ANALYSIS]${NC} Calculating population comparison metrics..."
    
    # Create a Python script for detailed analysis
    cat > "$OUTPUT_DIR/analysis.py" << 'EOF'
import json
import os

# German Census 2022 reference data
GERMAN_CENSUS_2022 = {
    "0-4": {"total": 3877937, "male": 1987683, "female": 1890251},
    "5-9": {"total": 3880730, "male": 1988215, "female": 1892512},
    "10-14": {"total": 3777504, "male": 1937288, "female": 1840217},
    "15-19": {"total": 3802662, "male": 1952159, "female": 1850504},
    "20-24": {"total": 4399638, "male": 2279369, "female": 2120264},
    "25-29": {"total": 4758696, "male": 2462150, "female": 2296544},
}

TOTAL_GERMAN_POPULATION = 83237124

def calculate_smr(observed, expected):
    """Calculate Standardized Morbidity Ratio"""
    return observed / expected if expected > 0 else None

def analyze_population_file(filepath):
    """Analyze a population report file"""
    with open(filepath, 'r') as f:
        data = json.load(f)
    
    total_patients = data.get('group', [{}])[0].get('population', [{}])[0].get('count', 0)
    
    print(f"\n📊 Analysis of {os.path.basename(filepath)}")
    print(f"   Total Patients: {total_patients:,}")
    
    # Analyze stratifiers
    for stratifier in data.get('group', [{}])[0].get('stratifier', []):
        strat_code = stratifier.get('code', [{}])[0].get('coding', [{}])[0].get('code', 'unknown')
        print(f"\n   🔍 Stratifier: {strat_code}")
        
        for stratum in stratifier.get('stratum', []):
            value = stratum.get('value', {}).get('text', 'Unknown')
            observed = stratum.get('population', [{}])[0].get('count', 0)
            
            # Calculate expected based on German reference if age group
            if value in GERMAN_CENSUS_2022:
                ref_data = GERMAN_CENSUS_2022[value]
                expected_percentage = (ref_data['total'] / TOTAL_GERMAN_POPULATION) * 100
                expected_count = (total_patients * expected_percentage) / 100
                smr = calculate_smr(observed, expected_count)
                
                print(f"      • {value}: {observed} observed vs {expected_count:.1f} expected (SMR: {smr:.2f})")
            else:
                print(f"      • {value}: {observed} patients")

# Analyze all report files
for filename in os.listdir('.'):
    if filename.endswith('.json') and 'MeasureReport' in filename:
        try:
            analyze_population_file(filename)
        except Exception as e:
            print(f"Error analyzing {filename}: {e}")
EOF

    # Run the analysis if Python is available
    if command -v python3 > /dev/null; then
        cd "$OUTPUT_DIR"
        python3 analysis.py
        cd - > /dev/null
    else
        echo -e "${YELLOW}[INFO]${NC} Python3 not available - detailed analysis skipped"
    fi
}

# Main execution
echo -e "\n${BLUE}[INFO]${NC} Starting population comparison evaluations..."

# Evaluate different measures (adapt to your actual measure IDs)
evaluate_population_comparison "mii-msr-summary-report-age-gender-cql" "MeasureReport-basic-demographics.json" "Basic Demographics (Age & Gender)"

evaluate_population_comparison "mii-msr-summary-report-composite-gender-age-cql" "MeasureReport-composite-demographics.json" "Composite Demographics (Age-Gender Cross-tabulation)"

# If you have the population comparison measure we created
# evaluate_population_comparison "mii-msr-population-comparison-germany" "MeasureReport-population-comparison.json" "Population Comparison with German Census 2022"

# Calculate detailed metrics
calculate_population_metrics

echo -e "\n=================================================="
echo -e "${GREEN}[INFO]${NC} Population comparison analysis completed!"
echo -e "${GREEN}[INFO]${NC} Reports saved in: $OUTPUT_DIR/"
echo -e "=================================================="

echo -e "\n${BLUE}[INFO]${NC} Generated files:"
ls -la "$OUTPUT_DIR/"