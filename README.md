# dockerized-flask-app-ec2

Step 1: Set Up Your Project
Create a Project Folder:

Open your file explorer and create a new folder named flask_app.
Open Command Prompt:

Press Win + R, type cmd, and hit Enter.
Navigate to Your Project Folder:

bash
Copy code
cd path\to\flask_app
Step 2: Install Python and Flask
Check if Python is Installed:

Type python --version in Command Prompt. If you see a version number, Python is installed. If not, download and install it from python.org.
Install Flask:

Run this command in Command Prompt:
bash
Copy code
pip install flask
Step 3: Create Your Flask App
Create a Python File:

In your flask_app folder, create a file named app.py.
Write the Code:

Open app.py in a text editor (like Notepad or VS Code) and paste this code:
python
Copy code
from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route("/")
def home():
    bg_color = os.environ.get("BG_COLOR", "lightblue")  # Default color
    return render_template("index.html", bg_color=bg_color)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)