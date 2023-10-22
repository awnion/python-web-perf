from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def index():
    return "Hello"


@app.get("/json")
async def json():
    return {"hello": "world"}
