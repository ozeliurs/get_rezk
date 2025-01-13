from flask import Flask

app = Flask(__name__)


@app.route("/pt/<string:payload>")
def definite_pt(payload: str) -> str:
    f = open(payload, "r")
    text = f.read()
    return text
