# Building a Docker Container for a Flask Application Using Ubuntu

## 1. Use the Official Ubuntu Image

```dockerfile
FROM ubuntu:latest
```

This line specifies that you want to use the latest version of the official Ubuntu image as the base for your Docker container. It serves as the starting point for your application.

## 2. Install Python and pip

```dockerfile
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean
```

- `RUN`: This instruction executes commands in a new layer on top of the current image and commits the results.
- `apt-get update`: Updates the package lists for upgrades and new package installations.
- `apt-get install -y python3 python3-pip`: Installs Python 3 and pip (the Python package installer). The `-y` flag automatically answers "yes" to any prompts, allowing the installation to proceed without user interaction.
- `apt-get clean`: Removes the local repository of retrieved package files to reduce the image size.

## 3. Set the Working Directory

```dockerfile
WORKDIR /app
```

This sets the working directory inside the container to `/app`. Any subsequent commands will be run in this directory. If the directory does not exist, Docker will create it.

## 4. Copy the App Files

```dockerfile
COPY . .
```

This command copies files from your local directory (where the Dockerfile is located) to the working directory inside the container (`/app`). The first `.` refers to the current directory on your local machine, and the second `.` refers to the current directory inside the container.

## 5. Install Flask

```dockerfile
RUN pip install flask --break-system-packages
```

This installs the Flask framework using pip. The `--break-system-packages` option is included to allow the installation despite any potential conflicts with system packages, which may be necessary depending on the environment.

## 6. Expose the Port the App Runs On

```dockerfile
EXPOSE 5000
```

This instruction informs Docker that the container listens on port 5000 at runtime. It doesn’t publish the port; it’s more of a documentation feature. When you run the container, you need to map this port to a port on your host machine.

## 7. Command to Run the Application

```dockerfile
CMD ["python3", "app.py"]
```

This line specifies the command that will run when the container starts. It tells Docker to run the Python interpreter with the `app.py` file as the argument. This is typically where your Flask application starts.