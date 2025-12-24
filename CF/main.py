# A standard Cloudflare Python Worker (No FastAPI)
from js import Response

async def on_fetch(request, env):
    return Response.new("Native Python Backend is Live!")
