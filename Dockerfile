FROM python:slim-stretch
LABEL AUTHOR="dalongrong"
LABEL EMAIL="1141591465@qq.com"
RUN apt-get update && apt-get install -y libzmq-dev libevent-dev gcc \
    && pip install circus circus-web \
    && apt-get remove -y --purge gcc libzmq-dev libevent-dev \
    && rm -rf /var/lib/apt/lists/*