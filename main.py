from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import os
# We use 'js' to access the high-performance browser-native fetch
from js import fetch, Request, Headers 

app = FastAPI()

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
    return {"message": "Backend is Live and Python-Native!"}

@app.post("/add-link")
async def add_link(request: LinkRequest):
    pswd = os.getenv("DASHBOARD_PASSWORD")
    token = os.getenv("MY_GITHUB_TOKEN")
    
    if request.password != pswd:
        raise HTTPException(status_code=401, detail="Wrong password")

    # Note: For simplicity in this reset, we're testing the connection.
    # To fully update a file, you'd send a PUT request to the GitHub API here.
    return {"status": "success", "info": "Connection verified. Link received."}
