from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route("/")
def home():
    bg_color = os.environ.get("BG_COLOR", "lightblue")  # Default color
    return render_template("index.html", bg_color=bg_color)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
