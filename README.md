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

![Locally Run](<img/Screenshot (36).png>)

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
FROM python:3.12-slim

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y python3-venv \
    && python3 -m venv venv

RUN . venv/bin/activate && pip install flask

EXPOSE 5000

ENV FLASK_APP=app.py

CMD ["venv/bin/python", "app.py"]
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

## Step 8: Push the Docker Image to Docker Hub

### Create a Docker Hub Account:
1. Sign up at Docker Hub.

### Log in to Docker Hub:
```bash
docker login
```

### Tag Your Image:
```bash
docker tag flask_app your_dockerhub_username/flask_app
```

### Push the Image:
```bash
docker push your_dockerhub_username/flask_app
```
![dockerHub Pushed](<img/Screenshot (33).png>)

## Docker Hub Repository

You can find the Docker image for this project on Docker Hub: [abhixsh/flask_app](https://hub.docker.com/r/abhixsh/flask_app)
## Step 9: Run Your Docker Container on EC2

### Launch an EC2 Instance:
1. Go to AWS Management Console and launch a new EC2 instance using an Ubuntu image.

### SSH into Your EC2 Instance:
1. Follow the instructions to connect via SSH.

### Install Docker on EC2:
```bash
sudo apt-get update
sudo apt-get install -y docker.io
```

### Pull Your Docker Image:
```bash
sudo docker pull your_dockerhub_username/flask_app
```

### Run Your Docker Container:
1. Replace `pink` with any color you want for the background:
```bash
sudo docker run -d -p 5000:5000 -e BG_COLOR=pink your_dockerhub_username/flask_app
```

### Access Your Flask App:
1. Open a web browser and go to `http://<Your-EC2-Public-IP>:5000`.

![Ec2 pushed](<img/Screenshot (35).png>)

## Check EC2 Security Group Settings

Make sure the Security Group associated with your EC2 instance allows inbound traffic on port 5000 (or the port you specified in your Docker command). To do this, go to the EC2 Dashboard > Instances > select your instance > Security > Security Groups. Click on the Security Group, then Edit Inbound Rules, and add the following rule:
- **Type:** Custom TCP
- **Port Range:** 5000
- **Source:** Anywhere (0.0.0.0/0) if it’s public, or specify your IP for more security.

![Inbound Rules](<img/Screenshot (34).png>)