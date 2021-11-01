FROM python:slim

RUN apt update && apt install -y gcc && \
    pip install beancount fava

WORKDIR /beancount

CMD fava ledger.bean --host 0.0.0.0 --port 8184