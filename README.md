# python circus docker image

use pip install

## Usage

* pull docker image

```code
docker pull dalongrong/circus
```

* demo dockerfile

> Dockerfile-Test

```code
FROM dalongrong/circus
WORKDIR /app
COPY circus.ini  /app/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
```

* circus config

> circus.ini

```code
[circus]
statsd = True
httpd =  False

[watcher:webapp]
cmd = /usr/local/bin/chaussette --fd $(circus.sockets.web)
numprocesses = 5
use_sockets = True

[socket:web]
host = 0.0.0.0
port = 9999
```

* docker-compose.yaml file

```code
version: "3"
services:
  circus:
    build: ./
  web:
    build:
      dockerfile: Dockerfile-Test
      context: ./
    ports:
    - "9999:9999"
    - "8080:8080"
```

* running

```code
docker-compose up -d web
```

* view result

```code
open http://localhost:9999
```

## some notes [fixed use dalongrong/circus:2.7-slim-stretch works]

current circushttpd  maybe not work still solve it

exception message like below

```code
web_1     | SyntaxError: invalid syntax
web_1     | Traceback (most recent call last):
web_1     |   File "<string>", line 1, in <module>
web_1     |   File "/usr/local/lib/python3.7/site-packages/circusweb/circushttpd.py", line 25, in <module>
web_1     |     import tornadio2
web_1     |   File "/usr/local/lib/python3.7/site-packages/tornadio2/__init__.py", line 25, in <module>
web_1     |     from tornadio2.router import TornadioRouter
web_1     |   File "/usr/local/lib/python3.7/site-packages/tornadio2/router.py", line 27, in <module>
web_1     |     from tornadio2 import persistent, polling, sessioncontainer, session, proto, preflight, stats
web_1     |   File "/usr/local/lib/python3.7/site-packages/tornadio2/persistent.py", line 143
web_1     |     except Exception, ex:
web_1     |                     ^
web_1     | SyntaxError: invalid syntax
```