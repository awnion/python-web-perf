from robyn import Robyn
from robyn import jsonify

app = Robyn(__file__)


@app.get("/")
async def index():
    return "Hello"


@app.get("/json")
async def json():
    return jsonify({"hello": "word"})


app.start(port=8000)
