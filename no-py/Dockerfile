FROM alpine:3.5

LABEL maintainer "https://github.com/blacktop"

ENV YARA_VERSION 3.6.3

RUN apk add --no-cache openssl file jansson bison tini su-exec
RUN apk add --no-cache -t .build-deps py-setuptools \
                                openssl-dev \
                                jansson-dev \
                                build-base \
                                libc-dev \
                                file-dev \
                                automake \
                                autoconf \
                                libtool \
                                flex \
                                git \
                                git \
  && set -x \
  && echo "Install Yara from source..." \
  && cd /tmp/ \
  && git clone --recursive --branch v$YARA_VERSION https://github.com/VirusTotal/yara.git \
  && cd /tmp/yara \
  && ./bootstrap.sh \
  && sync \
  && ./configure --enable-cuckoo \
                 --enable-magic \
                 --with-dotnet \
  && make \
  && make install \
  && echo "Make test_rule..." \
  && mkdir /rules \
  && echo "rule dummy { condition: true }" > /rules/test_rule \
  && rm -rf /tmp/* \
  && apk del --purge .build-deps

VOLUME ["/malware"]
VOLUME ["/rules"]

WORKDIR /malware

ENTRYPOINT ["su-exec","nobody","/sbin/tini","--","yara"]
CMD ["--help"]
