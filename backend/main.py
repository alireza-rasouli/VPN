from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from github import Github
import os

app = FastAPI()

# Allow your GitHub Pages site to talk to this API
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # You can restrict this to your github.io URL later
    allow_methods=["*"],
    allow_headers=["*"],
)

class LinkRequest(BaseModel):
    url: str
    password: str

@app.post("/add-link")
async def add_link(request: LinkRequest):
    # SIMPLE SECURITY: Set a password in your ClawCloud Environment Variables
    if request.password != os.getenv("DASHBOARD_PASSWORD"):
        raise HTTPException(status_code=403, detail="Wrong password!")

    token = os.getenv("MY_GITHUB_TOKEN")
    repo_name = "alireza-rasouli/VPN"
    
    try:
        g = Github(token)
        repo = g.get_repo(repo_name)
        
        # 1. Get the automate.py file
        file = repo.get_contents("automate.py")
        content = file.decoded_content.decode()
        
        # 2. Add the new link to the SOURCE_URLS list
        if request.url in content:
            return {"message": "Link already exists!"}
            
        updated_content = content.replace(
            "SOURCE_URLS = [", 
            f"SOURCE_URLS = [\n    '{request.url}',"
        )
        
        # 3. Commit the change
        repo.update_file(file.path, f"Add {request.url} via Dashboard", updated_content, file.sha)
        return {"status": "success", "message": "Link added to GitHub!"}
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
