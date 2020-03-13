# This is a very bad example of a Dockerfile. 
# Don't do this irl.

FROM python:3.7

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    libpq-dev \
    libffi-dev

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8080
CMD ["python", "src/app.py"]