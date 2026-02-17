# fhir-summary-reports

Implementation Guide (IG) and examples for generating population-level summary statistics (e.g., age distribution, gender distribution) from FHIR data.

Main IG deployment: https://medizininformatik-initiative.github.io/fhir-summary-reports/

## Overview

This repository provides a FHIR-based workflow for patient demographic analysis using:
- **CQL (Clinical Quality Language)** for age calculations and demographic stratification
- **FHIR Measure resources** with both separate and composite stratification approaches
- **Docker Compose** environment with Blaze FHIR server for local testing
- **Automated evaluation scripts** for measure execution and report generation

## Quick Start

### Prerequisites

- **Docker and Docker Compose** (required for all options)

### Option 1: Containerized Evaluation (Recommended - Cross-platform)

**All-in-one automated setup:**
```bash
# Unix-like systems (macOS, Linux, WSL)
./evaluate-measures-docker.sh

# Windows (Command Prompt or PowerShell)
evaluate-measures-docker.bat
```

These scripts automatically:
1. 🧹 Clean up any existing containers
2. 🚀 Start Blaze FHIR server with sample data
3. 🔍 Verify network connectivity and server readiness
4. 📊 Run containerized measure evaluation
5. 📄 Display results and file locations
6. 🛑 Provide cleanup instructions

**Expected Output:**
Upon completion, you'll see:
- ✅ `MeasureReport-age-gender-separate.json` 
- ✅ `MeasureReport-age-gender-composite.json`  
- 📁 Files saved in `./resources/` directory

### Option 2: Step-by-Step Container Management

**When the automated script has network issues, run containers individually:**

**Step 1: Start Blaze FHIR Server**
```bash
# Start only the Blaze server first
docker compose up -d blaze
```

**Step 2: Load Sample Data**
```bash
# Run the data initialization container
# This loads: sample Patient data, Measure definitions, and Library resource containing CQL content
docker compose up blaze-init
```

**Step 3: Run Measure Evaluation**
```bash
# Run the measure evaluation (builds automatically if needed)
docker compose up measure-evaluator
```

**Step 4: View Results**
```bash
# Results are automatically saved to local directory via volume mount
ls -la ./resources/MeasureReport-*.json

# View the reports
cat ./resources/MeasureReport-age-gender-separate.json
cat ./resources/MeasureReport-age-gender-composite.json
```

**Debugging Commands:**
```bash
# Check container status
docker compose ps

# View logs for specific services
docker compose logs blaze
docker compose logs blaze-init
docker compose logs measure-evaluator

# Test network connectivity between containers
docker compose exec blaze curl http://localhost:8080/fhir/metadata

# Check if data was loaded
curl -s "http://localhost:8080/fhir/Patient?_summary=count" | jq .total
```

### Option 3: Manual Setup with REST API Calls

**Step 1: Start Blaze FHIR Server**
```bash
# Start only the Blaze server first
docker compose up -d blaze
```

**Step 2: Load Sample Data**
```bash
# Run the data initialization container
# This loads: sample Patient data, Measure definitions, and Library resource containing CQL content
docker compose up blaze-init

# Wait for server to be ready (about 15-30 seconds)
curl -f http://localhost:8080/fhir/metadata
```

**Step 3: Evaluate Measures via REST API**

**Separate Stratifiers (Age and Gender independently):**
```bash
# Evaluate age-gender measure with separate stratification
curl -s "http://localhost:8080/fhir/Measure/mii-msr-summary-report-age-gender-cql/\$evaluate-measure?periodStart=1900&periodEnd=2025" \
  -H "Accept: application/fhir+json"
```

**Composite Stratifiers (Cross-tabulated Age×Gender combinations):**
```bash
# Evaluate composite age-gender measure  
curl -s "http://localhost:8080/fhir/Measure/mii-msr-summary-report-composite-gender-age-cql/\$evaluate-measure?periodStart=1900&periodEnd=2025" \
  -H "Accept: application/fhir+json"
```

**Step 4: Stop the Environment**
```bash
docker compose down
```

## Cleanup

To stop all services and clean up:
```bash
# Stop and remove containers
docker compose down

# Remove volumes (optional - removes all data)
docker compose down -v
```

## Architecture

### CQL Library (`input/cql/stratifier-age-gender.cql`)
Provides comprehensive patient age calculations and demographic stratification:
- `AgeInYears`, `AgeInMonths`, `AgeInDays` - Age calculations with null safety
- `AgeGroup` - Pediatric/Adult/Geriatric classification  
- `AgeDecade` - Age ranges (0-9, 10-19, 20-29, etc.)
- `AgeFiveYearGroups` - 5-year age ranges (0-4, 5-9, ..., 85-89, 90+) matching German census structure
- `AgeFiveYearGroupsMath` - Mathematical alternative for 5-year grouping
- `Gender` - Gender stratification
- Helper functions: `IsAdult`, `IsMinor`, `IsElderly`

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
- **Sample Data**: from https://github.com/medizininformatik-initiative/mii-testdata

## Key Differences: Separate vs Composite Stratification

| Aspect | Separate Stratifiers | Composite Stratifiers |
|--------|---------------------|----------------------|
| **Structure** | Multiple independent stratifiers | Single stratifier with components |
| **Analysis** | Individual dimension counts | Cross-tabulated intersections |
| **Use Case** | Basic demographic summaries | Detailed demographic analysis |
| **Example Output** | Gender: 12M, 8F<br>Age: 4 (50-59), 3 (40-49) | Gender-Age: 2 (M 50-59), 1 (F 50-59) |

## Files Structure

```
├── input/cql/stratifier-age-gender.cql # CQL library for 5-year age group calculations
├── input/fsh/                          # FSH source files for FHIR resources
├── resources/                          # Generated FHIR resources and reports
├── docker-compose.yaml                 # Container orchestration setup
├── Dockerfile.evaluate-measures        # Container for measure evaluation
├── evaluate-measures-docker.sh         # Cross-platform automated script (Unix)
├── evaluate-measures-docker.bat        # Cross-platform automated script (Windows)
└── evaluate-measures.sh                # Direct evaluation script (Linux/macOS)
```

## Troubleshooting

### Container Network Issues
If you encounter "network not found" errors with the automated script:

**Option A: Use Step-by-Step Approach (Recommended)**
```bash
# Follow Option 2 or 3 above for manual container management
# This avoids network timing issues
```

**Option B: Force Network Recreation**
```bash
# Clean up Docker state completely
docker compose down -v
docker system prune -f
docker network prune -f

# Restart with network recreation
docker compose up --force-recreate -d blaze
sleep 20
docker compose up blaze-init
docker compose up measure-evaluator
```

**Option C: Network Debugging**
```bash
# Check existing networks
docker network ls

# Inspect the project network
docker network inspect fhir-summary-reports_default

# Remove specific network if stuck
docker network rm fhir-summary-reports_default

# Restart services
docker compose up -d blaze
```

### Docker Network Issues
If you encounter "network not found" errors:
```bash
# Clean up Docker state
docker compose down
docker system prune -f
docker network prune -f

# Restart with containerized script (recommended)
./evaluate-measures-docker.sh
```

### Windows-Specific Issues
- **PowerShell Execution Policy**: If you get execution errors, run:
  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```
- **WSL Integration**: For best compatibility, enable Docker Desktop's WSL integration

### Port Conflicts
If port 8080 is already in use:
```bash
# Check what's using the port
netstat -an | grep 8080   # Linux/macOS
netstat -an | findstr 8080  # Windows

# Stop conflicting services or modify docker-compose.yaml ports
```
