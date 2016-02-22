FROM gliderlabs/alpine

MAINTAINER blacktop, https://github.com/blacktop

COPY rules /rules
RUN apk-install openssl file jansson
RUN apk-install -t build-deps git autoconf automake file-dev flex git jansson-dev libc-dev libtool build-base openssl-dev \
  && set -x \
  && cd /tmp/ \
  && git clone --recursive --branch v3.4.0 git://github.com/plusvic/yara \
  && cd /tmp/yara \
  && ./bootstrap.sh \
  && ./configure --enable-cuckoo \
                 --enable-magic \
                 --with-crypto \
  && make \
  && make install \
  && rm -rf /tmp/* \
  && apk del --purge build-deps

VOLUME ["/malware"]
VOLUME ["/rules"]

WORKDIR /malware

ENTRYPOINT ["yara"]

CMD ["--help"]
