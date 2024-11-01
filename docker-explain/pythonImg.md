# Dockerfile for Flask Project

```dockerfile
FROM python:3.12-slim
```
**Explanation:** This uses the slim version of Python 3.12 as the base image, which is a minimal version of Python that includes only essential packages. It keeps the image size small.

```dockerfile
WORKDIR /app
```
**Explanation:** Sets the working directory inside the container to `/app`. This is where all the app files will be stored and run from.

```dockerfile
COPY . /app
```
**Explanation:** Copies all the files from the current directory (where the Dockerfile is located on your computer) to the `/app` directory inside the container.

```dockerfile
RUN apt-get update && apt-get install -y python3-venv \
    && python3 -m venv venv
```
**Explanation:**
- `apt-get update`: Updates the package list.
- `apt-get install -y python3-venv`: Installs Python’s virtual environment package, `venv`, allowing us to isolate the dependencies.
- `python3 -m venv venv`: Creates a virtual environment named `venv` inside the `/app` directory.

```dockerfile
RUN . venv/bin/activate && pip install flask
```
**Explanation:**
- `. venv/bin/activate`: Activates the virtual environment we created in the previous step.
- `pip install flask`: Installs Flask within the virtual environment to keep dependencies isolated from the system Python.

```dockerfile
EXPOSE 5000
```
**Explanation:** Exposes port 5000, which is the default port for Flask. This allows Docker to understand that the app will be accessible on this port.

```dockerfile
ENV FLASK_APP=app.py
```
**Explanation:** Sets the `FLASK_APP` environment variable to `app.py`. This is a Flask-specific environment variable that tells Flask which file to run when starting the app.

```dockerfile
CMD ["venv/bin/python", "app.py"]
```
**Explanation:** The `CMD` instruction specifies the command to run when the container starts. Here:
- `venv/bin/python`: Uses the Python executable inside the virtual environment.
- `app.py`: Runs the `app.py` file as the main Flask application.
