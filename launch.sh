#!/bin/bash
# 1. Install system dependencies
apt-get update && apt-get install -y git

# 2. Install Python dependencies
pip install fastapi uvicorn PyGithub pydantic

# 3. Clone the latest code into a clean folder
git clone https://github.com/alireza-rasouli/VPN.git app_code
cd app_code

# 4. Start the server (using python -m to ensure uvicorn is found)
python3 -m uvicorn backend.main:app --host 0.0.0.0 --port 8000
