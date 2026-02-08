@echo off
REM RSV Restaurant Bot - Windows Setup Script

echo.
echo ================================================
echo RSV Restaurant Reservation Bot - Setup
echo ================================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.8+ from https://www.python.org/
    pause
    exit /b 1
)

echo [1/4] Installing Python dependencies...
pip install -r requirements.txt
if errorlevel 1 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo [2/4] Downloading TextBlob corpora...
python -m textblob.download_corpora
if errorlevel 1 (
    echo WARNING: Could not download corpora, continuing...
)

echo [3/4] Initializing database...
python database/seed.py
if errorlevel 1 (
    echo ERROR: Failed to initialize database
    pause
    exit /b 1
)

echo [4/4] Training ML model...
python -c "from chatbot.intent_model import IntentModel; m = IntentModel(); m.train() if m.model is None else print('Model already trained')"
if errorlevel 1 (
    echo WARNING: Model training may have issues, continuing...
)

echo.
echo ================================================
echo SETUP COMPLETE!
echo ================================================
echo.
echo To start the server, run:
echo   python app.py
echo.
echo Then open your browser to:
echo   http://localhost:8000
echo.
pause
