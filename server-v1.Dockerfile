# This is a very bad example of a Dockerfile. 
# Don't do this irl.

FROM python:3.7

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y libpq-dev
RUN apt-get install -y libffi-dev

WORKDIR /app

COPY . .
RUN pip install -r requirements.txt

EXPOSE 8080
CMD ["python", "src/app.py"]