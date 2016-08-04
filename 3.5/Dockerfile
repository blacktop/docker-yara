FROM gliderlabs/alpine:3.4

MAINTAINER blacktop, https://github.com/blacktop

ENV GOSU_VERSION 1.9

RUN apk-install openssl file jansson python tini
RUN apk-install -t build-deps git autoconf automake file-dev flex git jansson-dev libc-dev libtool build-base openssl-dev python-dev \
  && set -x \
  && echo "Grab gosu for easy step-down from root..." \
  && apk-install -t .gosu-deps \
                    dpkg \
                    gnupg \
                    openssl \
  && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
  && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
  && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
  && export GNUPGHOME="$(mktemp -d)" \
  && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
  && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
  && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
  && chmod +x /usr/local/bin/gosu \
  && gosu nobody true \
  && apk del .gosu-deps \
  && echo "Install Yara from source..." \
  && cd /tmp/ \
  && git clone --recursive --branch v3.5.0 https://github.com/VirusTotal/yara.git \
  && cd /tmp/yara \
  && ./bootstrap.sh \
  && ./configure --enable-cuckoo \
                 --enable-magic \
                 --with-crypto \
  && make \
  && make install \
  && echo "Install yara-python..." \
  && cd /tmp/ \
  && git clone --recursive --branch v3.5.0 https://github.com/VirusTotal/yara-python \
  && cd yara-python \
  && python setup.py build \
  && python setup.py install \
  && rm -rf /tmp/* \
  && apk del --purge build-deps

VOLUME ["/malware"]
VOLUME ["/rules"]

WORKDIR /malware

ENTRYPOINT ["gosu","nobody","/sbin/tini","--","yara"]

CMD ["--help"]
