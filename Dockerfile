FROM ubuntu:latest
MAINTAINER blacktop, https://github.com/blacktop

#Prevent daemon start during install
RUN echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d

# Install Yara
RUN apt-get -q update && apt-get install -y python \
                                            libtool \
                                            automake \
                                            autoconf \
                                            python-dev

ADD https://github.com/plusvic/yara/archive/v2.1.0.tar.gz /yara

RUN cd yara && ./build.sh && \
                make install
RUN ldconfig

ENTRYPOINT ["yara"]

# CMD ["-h"]
