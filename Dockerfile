FROM python:3.8-alpine3.12

LABEL maintainer="Takeru Sato <type.in.type@gmail.com>"

COPY boto /root/.boto
COPY run_crond /usr/local/bin/
COPY gsutil_wrapper /usr/local/bin/
COPY crontabs/root /root/crontabs/root
COPY requirements.txt /

#install deps and install gsutil
RUN apk add --update --no-cache --virtual build-deps \
  gcc \
  libffi-dev \
  linux-headers \
  musl-dev \
  openssl-dev &&\
  pip install -r /requirements.txt &&\
  apk del build-deps

ENTRYPOINT ["/usr/local/bin/run_crond"]
