from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import os

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def root():
    # Adding a version or folder name here helps you verify the right file is running
    return {"message": "Success! Backend running from /CF subfolder."}

@app.get("/status")
def status():
    return {"status": "online", "environment": "Cloudflare Python Worker"}
