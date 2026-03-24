FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY arxivcollector.py .

# Use /data as the runtime working directory so that relative output paths
# resolve inside the volume mounted by the user (e.g. -v "$(pwd):/data").
WORKDIR /data

ENTRYPOINT ["python", "/app/arxivcollector.py"]
