FROM alpine

MAINTAINER blacktop, https://github.com/blacktop

RUN buildDeps='autoconf \
              automake \
              file-dev \
              flex \
              gcc \
              git \
              jansson-dev \
              libc-dev \
              libtool \
              make \
              openssl-dev' \
  && set -x \
  && apk --update add openssl file jansson $buildDeps \
  && cd /tmp \
  && git clone --recursive --branch v3.4.0 git://github.com/plusvic/yara \
  && cd /tmp/yara \
  && ./bootstrap.sh \
  && ./configure --enable-cuckoo \
                 --enable-magic \
                 --with-crypto \
  && make \
  && make install \
  && apk del --purge $buildDeps \
  && rm -rf /tmp/* /root/.cache /var/cache/apk/*

# Add Yara Rules
ADD /rules /rules

VOLUME ["/malware"]
VOLUME ["/rules"]

WORKDIR /malware

ENTRYPOINT ["yara"]
