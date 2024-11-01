# Use the official Python image as a base
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install virtual environment package and create a virtual environment
RUN apt-get update && apt-get install -y python3-venv \
    && python3 -m venv venv

# Activate the virtual environment and install Flask
RUN . venv/bin/activate && pip install flask

# Expose the port the app runs on
EXPOSE 5000

# Set the environment variable for Flask
ENV FLASK_APP=app.py

# Use the virtual environment to run the app
CMD ["venv/bin/python", "app.py"]
