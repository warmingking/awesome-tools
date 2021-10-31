FROM python:slim

RUN apt update && apt install -y gcc && \
    pip install beancount fava

WORKDIR /beancount

CMD fava entry.beancount --host 0.0.0.0 --port 8184