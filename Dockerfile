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
                      libpcre3-dev \
                      python-dev \
                      git-core \
                      autoconf \
                      automake \
                      libpcre3 \
                      libtool \
                      python --no-install-recommends

# Install Yara and remove install dir after to conserve space
RUN  \
  git clone --recursive --branch v3.1.0 git://github.com/plusvic/yara && \
  cd yara && \
  ./bootstrap.sh && \
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

VOLUME /malware

ENTRYPOINT ["yara"]
