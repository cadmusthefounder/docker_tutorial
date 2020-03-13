# Don't do this in production! This Dockerfile is only used
# for demo purposes.

FROM python:3.7-slim

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    libpq-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080
CMD ["python", "src/app.py"]