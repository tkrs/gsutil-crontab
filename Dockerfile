FROM alpine:3.8

MAINTAINER Takeru Sato <type.in.type@gmail.com>

COPY boto /root/.boto
COPY run_crond /usr/local/bin/
COPY gsutil_wrapper /usr/local/bin/
COPY crontabs/root /root/crontabs/root

#install deps and install gsutil
RUN apk add --update \
    python \
    py-pip \
    py-cffi \
    py-cryptography \
 && pip install --upgrade pip \
 && apk add --no-cache --virtual build-deps \
    gcc \
    libffi-dev \
    python-dev \
    linux-headers \
    musl-dev \
    openssl-dev \
 && pip install gsutil \
 && apk del build-deps

ENTRYPOINT ["/usr/local/bin/run_crond"]
