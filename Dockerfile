FROM python:slim-stretch
LABEL AUTHOR="dalongrong"
LABEL EMAIL="1141591465@qq.com"
RUN apt-get update && apt-get install -y  --reinstall build-essential \
    && pip install circus circus-web chaussette \
    && pip uninstall -y tornado  \
    && pip install tornado==4.2 \
    && apt-get remove -y --purge build-essential \
    && rm -rf /var/lib/apt/lists/*