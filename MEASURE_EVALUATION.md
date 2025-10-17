# FHIR Measure Evaluation - Docker Container

This directory contains a containerized solution for evaluating FHIR measures that works across Windows, macOS, and Linux systems.

## 🚀 Quick Start

### Prerequisites
- [Docker](https://docs.docker.com/get-docker/) installed and running
- [Docker Compose](https://docs.docker.com/compose/install/) (included with Docker Desktop)

### Running the Evaluation

#### Option 1: Cross-platform script (Recommended)

**On Linux/macOS:**
```bash
./evaluate-measures-docker.sh
```

**On Windows:**
```batch
evaluate-measures-docker.bat
```

#### Option 2: Direct Docker Compose commands

```bash
# Start FHIR server and load test data
docker compose up -d blaze blaze-init

# Run measure evaluation
docker compose --profile evaluation up --build measure-evaluator

# Stop all services when done
docker compose down
```

## 📋 What it does

1. **Starts Blaze FHIR Server** - Runs on port 8080
2. **Loads test data** - Uploads FHIR resources for testing
3. **Evaluates measures** - Calls `$evaluate-measure` operations
4. **Saves results** - MeasureReport JSON files in `./resources/` directory

## 📁 Generated Files

The evaluation creates MeasureReport files in the `./resources/` directory:
- `MeasureReport-age-gender-separate.json` - Separate age and gender stratifiers
- `MeasureReport-age-gender-composite.json` - Composite age-gender stratification

## 🛠 Technical Details

### Container Architecture
- **Base Image**: Ubuntu 22.04
- **Tools**: curl, jq for JSON processing
- **Network**: Internal Docker network for service communication
- **Volumes**: Maps `./resources/` for output files

### Services
- **blaze**: Samply Blaze FHIR server
- **blaze-init**: Uploads test data using blazectl
- **measure-evaluator**: Runs measure evaluation (profile: evaluation)

## 🔧 Configuration

### Environment Variables
- `TZ=Europe/Berlin` - Timezone for containers
- `LOG_LEVEL=debug` - Blaze logging level

### Ports
- `8080` - Blaze FHIR server (mapped to host)

### Volume Mounts
- `./resources/` → `/app/output` - Output directory for MeasureReports
- `./resources/testdata/` → Container test data directory

## 🐛 Troubleshooting

### Container won't start
```bash
# Check Docker is running
docker --version

# Check available images
docker images

# View logs
docker compose logs measure-evaluator
```

### FHIR server connection issues
```bash
# Check if Blaze is running
docker compose ps

# View Blaze logs
docker compose logs blaze

# Test connectivity
curl http://localhost:8080/fhir/metadata
```

### Permission issues (Linux/macOS)
```bash
# Make script executable
chmod +x evaluate-measures-docker.sh
```

## 📚 Related Files

- `Dockerfile.evaluate-measures` - Container definition
- `evaluate-measures-container.sh` - Container evaluation script
- `docker-compose.yaml` - Service orchestration
- `evaluate-measures.sh` - Original shell script (legacy)
