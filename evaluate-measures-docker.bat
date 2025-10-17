@echo off
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

REM Start the FHIR server and dependencies
echo 🚀 Starting FHIR server and dependencies...
%COMPOSE_CMD% up -d blaze blaze-init

REM Wait for services to be ready
echo ⏳ Waiting for services to initialize...
timeout /t 5 /nobreak >nul

REM Run the measure evaluation
echo 📊 Running measure evaluation...
%COMPOSE_CMD% --profile evaluation up --build measure-evaluator

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