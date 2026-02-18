#!/bin/bash
# RSV Restaurant Bot - Linux/Mac Setup Script

echo ""
echo "================================================"
echo "RSV Restaurant Reservation Bot - Setup"
echo "================================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python 3 is not installed"
    echo "Please install Python 3.8+ and try again"
    exit 1
fi

echo "[1/4] Installing Python dependencies..."
pip3 install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to install dependencies"
    exit 1
fi

echo "[2/4] Downloading TextBlob corpora..."
python3 -m textblob.download_corpora
if [ $? -ne 0 ]; then
    echo "WARNING: Could not download corpora, continuing..."
fi

echo "[3/4] Initializing database..."
python3 database/seed.py
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to initialize database"
    exit 1
fi

echo "[4/4] Training ML model..."
python3 -c "from chatbot.intent_model import IntentModel; m = IntentModel(); m.train() if m.model is None else print('Model already trained')"
if [ $? -ne 0 ]; then
    echo "WARNING: Model training may have issues, continuing..."
fi

echo ""
echo "================================================"
echo "SETUP COMPLETE!"
echo "================================================"
echo ""
echo "To start the server, run:"
echo "  python3 app.py"
echo ""
echo "Then open your browser to:"
echo "  http://localhost:8000"
echo ""
