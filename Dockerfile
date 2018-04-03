FROM alpine:3.7

MAINTAINER Takeru Sato <type.in.type@gmail.com>

COPY boto /root/.boto
COPY run.sh /bin/run.sh
COPY gsutil_wrapper.sh /bin/gsutil_wrapper
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
  && apk del build-deps \
  && chmod 755 /bin/gsutil_wrapper

ENTRYPOINT ["/bin/run.sh"]
