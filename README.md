# fhir-summary-reports

Implementation Guide and examples for generating population-level summary statistics (e.g., age distribution, gender distribution) from FHIR data.

## Overview

This repository provides a complete FHIR-based workflow for patient demographic analysis using:
- **CQL (Clinical Quality Language)** for age calculations and demographic stratification
- **FHIR Measure resources** with both separate and composite stratification approaches
- **Docker Compose** environment with Blaze FHIR server for local testing
- **Automated evaluation scripts** for measure execution and report generation

## Quick Start

### Prerequisites

- Docker and Docker Compose
- `jq` (for JSON formatting)

### 1. Start the FHIR Server

```bash
# Start Blaze FHIR server with sample data
docker-compose up -d

# Wait for server to be ready (about 10-15 seconds)
```

### 2. Evaluate Measures

```bash
# Make the script executable
chmod +x evaluate-measures.sh

# Run measure evaluations
./evaluate-measures.sh
```

This will:
- Check if the FHIR server is running
- Evaluate both demographic measures
- Save MeasureReport resources to `./resources/`

### 3. View Results

Generated reports will be saved as:
- `./resources/MeasureReport-age-gender-separate.json` - Independent gender and age stratification
- `./resources/MeasureReport-age-gender-composite.json` - Cross-tabulated gender-age combinations

### 4. Stop the Environment

```bash
docker-compose down
```

## Architecture

### CQL Library (`stratifier-birth-year.cql`)
Provides comprehensive patient age calculations:
- `AgeInYears`, `AgeInMonths`, `AgeInDays` - Age calculations with null safety
- `AgeGroup` - Pediatric/Adult/Geriatric classification
- `AgeDecade` - Age ranges (0-9, 10-19, 20-29, etc.)
- `Gender` - Gender stratification

### FHIR Measures

**Separate Stratifiers** (`mii-msr-summary-report-age-gender-cql`):
- Independent gender counts (male: 12, female: 8, other: 2)
- Independent age decade counts (distributed across age ranges)

**Composite Stratifiers** (`mii-msr-summary-report-composite-gender-age-cql`):
- Cross-tabulated gender-age combinations using component stratification
- Enables analysis like "male 50-59", "female 40-49", etc.

### Docker Environment
- **Blaze FHIR Server**: R4-compliant server with `$evaluate-measure` support
- **Sample Data**: Automatically loaded via blazectl

## Key Differences: Separate vs Composite Stratification

| Aspect | Separate Stratifiers | Composite Stratifiers |
|--------|---------------------|----------------------|
| **Structure** | Multiple independent stratifiers | Single stratifier with components |
| **Analysis** | Individual dimension counts | Cross-tabulated intersections |
| **Use Case** | Basic demographic summaries | Detailed demographic analysis |
| **Example Output** | Gender: 12M, 8F<br>Age: 4 (50-59), 3 (40-49) | Gender-Age: 2 (M 50-59), 1 (F 50-59) |

## Files Structure

```
├── stratifier-birth-year.cql           # CQL library for age calculations
├── input/fsh/                          # FSH source files for FHIR resources
├── resources/                          # Generated FHIR resources and reports
├── docker-compose.yaml                 # Local FHIR server setup
├── evaluate-measures.sh                # Automated evaluation script
└── Bundle-mii-bdl-measure-library-transaction-bundle.json  # Complete FHIR bundle
```