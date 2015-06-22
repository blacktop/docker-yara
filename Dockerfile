FROM debian:jessie

MAINTAINER blacktop, https://github.com/blacktop

RUN apt-get -qq update \
  && apt-get install -yq yara python-yara \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# # Add Yara Rules
ADD /rules /rules

VOLUME ["/malware"]
VOLUME ["/rules"]

WORKDIR /malware

ENTRYPOINT ["yara"]
