from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from workers import WorkerEntrypoint
import asgi

# Create the FastAPI app
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "FastAPI is now live using the WorkerEntrypoint bridge!"}

# The required bridge for Cloudflare Python Workers
class Default(WorkerEntrypoint):
    async def fetch(self, request):
        # This connects the incoming worker request to the FastAPI app
        return await asgi.fetch(app, request, self.env)
