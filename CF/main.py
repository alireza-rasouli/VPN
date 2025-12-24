from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from workers import WorkerEntrypoint
import asgi

# 1. Create your FastAPI app as usual
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "FastAPI is now live on Cloudflare!"}

# 2. This is the 'bridge' Cloudflare needs
class Default(WorkerEntrypoint):
    async def fetch(self, request):
        # This connects the incoming request to the FastAPI app
        return await asgi.fetch(app, request, self.env)
