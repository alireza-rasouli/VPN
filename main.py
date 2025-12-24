from fastapi import FastAPI, HTTPException, Header
from pydantic import BaseModel
from github import Github
import os

app = FastAPI()

# Cloudflare will automatically inject these from your "Variables" settings
GITHUB_TOKEN = os.getenv("MY_GITHUB_TOKEN")
DASHBOARD_PASSWORD = os.getenv("DASHBOARD_PASSWORD")
REPO_NAME = "alireza-rasouli/VPN" # Change this to your repo name

class LinkRequest(BaseModel):
    password: str
    url: str

@app.get("/")
async def root():
    return {"status": "Backend is running on Cloudflare!"}

@app.post("/add-link")
async def add_link(request: LinkRequest):
    # 1. Security Check
    if request.password != DASHBOARD_PASSWORD:
        raise HTTPException(status_code=401, detail="Invalid Password")

    try:
        # 2. Connect to GitHub
        g = Github(GITHUB_TOKEN)
        repo = g.get_repo(REPO_NAME)
        
        # 3. Logic to update your file (example: updating index.html or a links.json)
        # This is where your specific "Add Link" logic goes
        
        return {"message": "Link added successfully!"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
