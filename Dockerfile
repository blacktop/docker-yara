FROM debian:jessie
# FROM ubuntu:latest
MAINTAINER blacktop, https://github.com/blacktop

#Prevent daemon start during install
RUN echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d

# Install Yara
RUN apt-get -q update && \
  apt-get install -y python-dev \
                     automake \
                     autoconf \
                     libtool \
                     python

ADD https://github.com/plusvic/yara/archive/v2.1.0.tar.gz /
ADD /rules /rules
RUN echo $(ls)
RUN tar -zxf yara-2.1.0.tar.gz && \
  cd yara-2.1.0 && \
  ./build.sh && \
  make install && \
  ldconfig && \
  rm yara-2.1.0.tar.gz && \
  rm -rf /yara-2.1.0

ENTRYPOINT ["yara"]

# CMD ["-h"]
