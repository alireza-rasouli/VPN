from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import os
from github import Github

app = FastAPI()

# This allows your dashboard (index.html) to communicate with this backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], 
    allow_methods=["*"],
    allow_headers=["*"],
)

class LinkRequest(BaseModel):
    password: str
    url: str

@app.get("/")
def root():
    return {"message": "Backend is Live!"}

@app.post("/add-link")
def add_link(request: LinkRequest):
    # These are pulled from your Cloudflare Dashboard Settings
    pswd = os.getenv("DASHBOARD_PASSWORD")
    token = os.getenv("MY_GITHUB_TOKEN")
    
    if request.password != pswd:
        raise HTTPException(status_code=401, detail="Wrong password")
    
    try:
        g = Github(token)
        # Your GitHub update logic goes here...
        return {"status": "success", "link_added": request.url}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
# No 'if __name__ == "__main__":' block needed
# Just make sure 'app' is defined at the top level
app = FastAPI()
