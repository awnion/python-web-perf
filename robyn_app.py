import os
from robyn import Robyn
from robyn import jsonify

app = Robyn(__file__)


@app.get("/")
async def index():
    return "Hello"


@app.get("/json")
async def json():
    return jsonify({"hello": "word"})


if __name__ == "__main__":
    port = os.environ.get("PORT", 5001)
    app.start(port=port)
