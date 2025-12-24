from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import os
from github import Github

app = FastAPI()

# Enable CORS so your GitHub Pages site can talk to this worker
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
    return {"message": "Python Backend is Live!"}

@app.post("/add-link")
def add_link(request: LinkRequest):
    # Variables pulled from Cloudflare Settings
    pswd = os.getenv("DASHBOARD_PASSWORD")
    token = os.getenv("MY_GITHUB_TOKEN")
    
    if request.password != pswd:
        raise HTTPException(status_code=401, detail="Wrong password")
    
    # Your GitHub Logic here...
    return {"status": "success", "link_added": request.url}
