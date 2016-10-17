FROM gliderlabs/alpine:3.4

MAINTAINER Takeru Sato <midium.size@gmail.com>

COPY boto /root/.boto
COPY run.sh /bin/run.sh
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

CMD /bin/run.sh && exec crond -f -c /root/crontabs
