FROM python:slim-stretch
LABEL AUTHOR="dalongrong"
LABEL EMAIL="1141591465@qq.com"
RUN apt-get update && apt-get install -y  gcc \
    && pip install circus circus-web \
    && apt-get remove -y --purge gcc \
    && rm -rf /var/lib/apt/lists/*