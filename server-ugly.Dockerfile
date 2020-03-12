# Don't do this in production! This Dockerfile is only used
# for demo purposes.

FROM python:3.7

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 8080
CMD ["python", "src/app.py"]