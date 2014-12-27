FROM debian:wheezy

MAINTAINER blacktop, https://github.com/blacktop

# Prevent daemon start during install
RUN echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d

# Install Yara Required Dependencies
RUN \
  apt-get -qq update && \
  apt-get install -yq build-essential \
                      libjansson-dev \
                      libmagic-dev \
                      pkg-config \
                      python-dev \
                      git-core \
                      automake \
                      autoconf \
                      openssl \
                      libtool \
                      python \
                      flex --no-install-recommends && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Yara and remove install dir after to conserve space
ADD http://www.digip.org/jansson/releases/jansson-2.7.tar.gz /
RUN \
  tar -zxvf /jansson-2.7.tar.gz && \
  rm /jansson-2.7.tar.gz && \
  cd /jansson-2.7 && \
  ./configure && \
  make && \
  make check && \
  make install && \
  git clone --recursive --branch v3.2.0 git://github.com/plusvic/yara && \
  cd yara && \
  autoreconf -i && \
  ./configure --enable-cuckoo --enable-magic && \
  make && \
  make install && \
  echo "/usr/local/lib" >> /etc/ld.so.conf && \
  ldconfig && \
  cd yara-python && \
  python setup.py build && \
  python setup.py install && \
  rm -rf /yara && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add Yara Rules
ADD /rules /rules

VOLUME ["/malware"]
VOLUME ["/rules"]

WORKDIR /malware

ENTRYPOINT ["yara"]
