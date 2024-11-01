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

Step 4: Create the HTML Template
Create a Folder for Templates:

Inside the flask_app folder, create a new folder named templates.
Create an HTML File:

Inside the templates folder, create a file named index.html.
Write the HTML Code:

Open index.html in a text editor and paste this code:
html
Copy code
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flask App</title>
    <style>
        body {
            background-color: {{ bg_color }}; /* Background color from environment variable */
            color: black;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
    </style>
</head>
<body>
    <h1>Hello, Flask!</h1>
    <p>Welcome to your simple Flask web app.</p>
</body>
</html>
Step 5: Test Your Flask App
Run the App:

In Command Prompt, navigate to your project folder again:
bash
Copy code
cd path\to\flask_app
Run the app with:
bash
Copy code
python app.py
Open a Web Browser:

Go to http://127.0.0.1:5000. You should see your Flask app!