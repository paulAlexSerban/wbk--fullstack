FROM python:3.13

RUN apt-get update && apt-get install -y libpcap-dev

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt