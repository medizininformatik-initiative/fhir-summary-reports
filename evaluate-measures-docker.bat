@echo off
REM Cross-platform FHIR Measure Evaluation using Docker
REM This script works on Windows Command Prompt and PowerShell
REM For Unix-like systems (macOS/Linux), use evaluate-measures-docker.sh

echo ==================================================
echo   FHIR Measure Evaluation (Docker)
echo ==================================================
echo.

REM Check if Docker is available
docker --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker is not installed or not in PATH
    echo Please install Docker from: https://docs.docker.com/get-docker/
    pause
    exit /b 1
)

REM Check Docker Compose availability
docker compose version >nul 2>&1
if errorlevel 1 (
    docker-compose --version >nul 2>&1
    if errorlevel 1 (
        echo ❌ Docker Compose is not available
        echo Please install Docker Compose or update to Docker Desktop
        pause
        exit /b 1
    )
    set COMPOSE_CMD=docker-compose
) else (
    set COMPOSE_CMD=docker compose
)

echo 🐳 Using: %COMPOSE_CMD%
echo.

REM Cleanup existing containers
echo 🧹 Cleaning up existing containers...
%COMPOSE_CMD% down

REM Start the FHIR server and dependencies
echo 🚀 Starting FHIR server and dependencies...
%COMPOSE_CMD% up -d blaze blaze-init

REM Verify Docker network is ready
echo 🔍 Verifying Docker network is ready...
docker network ls --filter name=fhir-summary-reports --format "{{.Name}}" | findstr /c:"fhir-summary-reports" >nul
if errorlevel 1 (
    echo ⚠️  Network not found, ensuring it's created...
    %COMPOSE_CMD% down
    %COMPOSE_CMD% up -d blaze blaze-init
)

REM Wait for services to be ready and data to be uploaded
echo ⏳ Waiting for services to initialize and data upload...
echo    This may take 15-30 seconds for first-time setup...
timeout /t 15 /nobreak >nul

REM Additional check: ensure blaze is responding before proceeding
echo 🔍 Verifying FHIR server is ready...
set WAIT_COUNT=0
:wait_loop
if %WAIT_COUNT% geq 30 goto wait_timeout
curl -s -f "http://localhost:8080/fhir/metadata" >nul 2>&1
if errorlevel 1 (
    set /a WAIT_COUNT+=1
    echo    Waiting for FHIR server... (%WAIT_COUNT%/30)
    timeout /t 2 /nobreak >nul
    goto wait_loop
)
echo ✅ FHIR server is responding on host
goto wait_complete

:wait_timeout
echo ⚠️  FHIR server not responding after 60 seconds
echo    Continuing anyway...

:wait_complete
REM Check data upload status
echo 📋 Checking data upload status...
curl -s "http://localhost:8080/fhir/Patient?_summary=count" | findstr /c:"total" >nul
if errorlevel 1 (
    echo ⏳ Waiting for data upload to complete...
    timeout /t 10 /nobreak >nul
)

REM Allow network to stabilize
echo 🌐 Allowing network to stabilize...
REM Allow network to stabilize
echo 🌐 Allowing network to stabilize...
timeout /t 3 /nobreak >nul

REM Pre-build the measure evaluator container while network is stable
echo 🔨 Building measure evaluator container...
%COMPOSE_CMD% build measure-evaluator
if errorlevel 1 (
    echo ❌ Failed to build measure evaluator container
    pause
    exit /b 1
)
echo ✅ Container built successfully

REM Run the measure evaluation with retry logic
echo 📊 Running measure evaluation...
set ATTEMPT=1
:retry_loop
echo 🔄 Attempt %ATTEMPT% of 3...
REM Force recreation of the measure-evaluator container to get fresh network references
%COMPOSE_CMD% --profile evaluation up --no-build --force-recreate measure-evaluator
if not errorlevel 1 goto success

set /a ATTEMPT+=1
if %ATTEMPT% leq 3 (
    echo ⚠️  Evaluation failed, retrying in 10 seconds...
    timeout /t 10 /nobreak >nul
    %COMPOSE_CMD% --profile evaluation down >nul 2>&1
    timeout /t 2 /nobreak >nul
    goto retry_loop
)

echo ❌ Evaluation failed after 3 attempts
goto end

:success
echo ✅ Measure evaluation completed successfully!

:end
REM Show results
echo.
echo ==================================================
echo ✅ Evaluation completed!
echo ==================================================
echo.

if exist "resources\MeasureReport-*.json" (
    echo 📄 Generated MeasureReport files:
    dir /b resources\MeasureReport-*.json
    echo.
    echo 💡 Files are saved in .\resources\ directory
) else (
    echo ⚠️  No MeasureReport files found in .\resources\
)

echo.
echo 🛑 To stop all services, run:
echo    %COMPOSE_CMD% down
echo.
pause