#!/bin/bash
# 1. Install necessary system tools
apt-get update && apt-get install -y git

# 2. Install Python libraries
pip install fastapi uvicorn PyGithub pydantic

# 3. Clone the latest code into a temporary folder
git clone https://github.com/alireza-rasouli/VPN.git temp_repo
cd temp_repo

# 4. Start the server
python3 -m uvicorn backend.main:app --host 0.0.0.0 --port 8000
