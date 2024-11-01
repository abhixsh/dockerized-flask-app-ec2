FROM python:3.12-slim

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y python3-venv \
    && python3 -m venv venv

RUN . venv/bin/activate && pip install flask

EXPOSE 5000

ENV FLASK_APP=app.py

CMD ["venv/bin/python", "app.py"]
