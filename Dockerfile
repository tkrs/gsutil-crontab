FROM gliderlabs/alpine:3.3

MAINTAINER Takeru Sato <midium.size@gmail.com>

COPY run.sh /bin/run.sh
COPY crontabs/root /root/crontabs/root
#install deps and install gsutil
RUN apk add --update \
    python \
    py-pip \
    py-cffi \
    py-cryptography \
  && pip install --upgrade pip \
  && apk add --virtual build-deps \
    gcc \
    libffi-dev \
    python-dev \
    linux-headers \
    musl-dev \
    openssl-dev \
  && pip install gsutil \
  && apk del build-deps \
  && rm -rf /var/cache/apk/*

RUN echo "[GoogleCompute]\nservice_account = default" >> /root/.boto

CMD /bin/run.sh && crond -f -c /root/crontabs
