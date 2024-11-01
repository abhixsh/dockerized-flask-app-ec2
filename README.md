# Dockerized Flask App on EC2

## Step 1: Set Up Your Project

### Create a Project Folder:
1. Open your file explorer and create a new folder named `flask_app`.

### Open Command Prompt:
1. Press `Win + R`, type `cmd`, and hit Enter.

### Navigate to Your Project Folder:
```bash
cd path\to\flask_app
```

## Step 2: Install Python and Flask

### Check if Python is Installed:
1. Type `python --version` in Command Prompt. If you see a version number, Python is installed. If not, download and install it from [python.org](https://www.python.org/).

### Install Flask:
1. Run this command in Command Prompt:
```bash
pip install flask
```

## Step 3: Create Your Flask App

### Create a Python File:
1. In your `flask_app` folder, create a file named `app.py`.

### Write the Code:
1. Open `app.py` in a text editor (like Notepad or VS Code) and paste this code:
```python
from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route("/")
def home():
    bg_color = os.environ.get("BG_COLOR", "lightblue")  # Default color
    return render_template("index.html", bg_color=bg_color)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
```

## Step 4: Create the HTML Template

### Create a Folder for Templates:
1. Inside the `flask_app` folder, create a new folder named `templates`.

### Create an HTML File:
1. Inside the `templates` folder, create a file named `index.html`.

### Write the HTML Code:
1. Open `index.html` in a text editor and paste this code:
```html
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
```

## Step 5: Test Your Flask App

### Run the App:
1. In Command Prompt, navigate to your project folder again:
```bash
cd path\to\flask_app
```
2. Run the app with:
```bash
python app.py
```

### Open a Web Browser:
1. Go to `http://127.0.0.1:5000`. You should see your Flask app!

## Step 6: Create a Dockerfile

### Create a Dockerfile:
1. In the `flask_app` folder, create a file named `Dockerfile` (no extension).

### Write the Dockerfile Code:
1. Open the `Dockerfile` in a text editor and paste this code:
```dockerfile
# Use the official Ubuntu image
FROM ubuntu:latest

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Set the working directory
WORKDIR /app

# Copy the app files
COPY . .

# Install Flask
RUN pip3 install flask

# Expose the port the app runs on
EXPOSE 5000

# Install dependencies
RUN pip3 install -r requirements.txt

# Command to run the application
CMD ["python3", "app.py"]
```

### Create a `requirements.txt` File:
1. Create a `requirements.txt` file in the `flask_app` folder and add the following line:
```
flask
```

## Step 7: Build the Docker Image

### Install Docker:
1. Download and install Docker Desktop from Docker's website.

### Open Docker Command Line:
1. You can use the Command Prompt or PowerShell.

### Navigate to Your Project Folder:
```bash
cd path\to\flask_app
```

### Build the Docker Image:
```bash
docker build -t flask_app .
```