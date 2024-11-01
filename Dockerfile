# Use the official Ubuntu image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install Python, pip, and other dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev build-essential && \
    apt-get clean

# Set the working directory
WORKDIR /

# Copy the app files
COPY . .

# Install Flask
RUN pip3 install flask

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["python3", "app.py"]
