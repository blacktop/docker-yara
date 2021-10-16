![YARA-logo](https://raw.githubusercontent.com/blacktop/docker-yara/master/logo.png)

# Yara Dockerfile

[![Publish Docker Image](https://github.com/blacktop/docker-yara/actions/workflows/docker-image.yml/badge.svg)](https://github.com/blacktop/docker-yara/actions/workflows/docker-image.yml) [![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org) [![Docker Stars](https://img.shields.io/docker/stars/blacktop/yara.svg)](https://hub.docker.com/r/blacktop/yara/) [![Docker Pulls](https://img.shields.io/docker/pulls/blacktop/yara.svg)](https://hub.docker.com/r/blacktop/yara/) [![Docker Image](https://img.shields.io/badge/docker%20image-63.1MB-blue.svg)](https://hub.docker.com/r/blacktop/yara/)

This repository contains a **Dockerfile** of [Yara](http://virustotal.github.io/yara/).

---

## Dependencies

- [alpine](https://hub.docker.com/_/alpine)

## Image Tags

```bash
REPOSITORY          TAG                 SIZE
blacktop/yara       latest              63.1MB
blacktop/yara       4.1                 63.1MB
blacktop/yara       4.0                 60MB
blacktop/yara       3.11                57.6MB
blacktop/yara       3.10                53.6MB
blacktop/yara       3.9                 53.6MB
blacktop/yara       3.8                 55.8MB
blacktop/yara       3.7                 55.2MB
blacktop/yara       3.6                 55.8MB
blacktop/yara       3.5                 54.3MB
blacktop/yara       w-rules             60.4MB
blacktop/yara       no-py               15MB
blacktop/yara       3.4                 54.3MB
blacktop/yara       3.1.0               163.7MB (debian:jessie)
```

> **NOTE:**
>
> - tag **no-py** is `yara:4.1` without yara-python<br>
> - tag **w-rules** is `yara:4.1` with some default yara rules included in the /rules directory.

## Installation

1. Install [Docker](https://docs.docker.com).
2. Download [trusted build](https://hub.docker.com/r/blacktop/yara/) from public [Docker Registry](https://hub.docker.com/): `docker pull blacktop/yara`

## Getting Started

```bash
$ docker run --rm -v /path/to/rules:/rules:ro \
                  -v /path/to/malware:/malware:ro \
                  blacktop/yara /rules/RULES_FILE FILE
```

```
YARA 3.6.0, the pattern matching swiss army knife.
Usage: yara [OPTION]... RULES_FILE FILE | DIR | PID

Mandatory arguments to long options are mandatory for short options too.

  -t,  --tag=TAG                   print only rules tagged as TAG
  -i,  --identifier=IDENTIFIER     print only rules named IDENTIFIER
  -n,  --negate                    print only not satisfied rules (negate)
  -D,  --print-module-data         print module data
  -g,  --print-tags                print tags
  -m,  --print-meta                print metadata
  -s,  --print-strings             print matching strings
  -L,  --print-string-length       print length of matched strings
  -e,  --print-namespace           print rules' namespace
  -p,  --threads=NUMBER            use the specified NUMBER of threads to scan a directory
  -l,  --max-rules=NUMBER          abort scanning after matching a NUMBER of rules
  -d VAR=VALUE                     define external variable
  -x MODULE=FILE                   pass FILE's content as extra data to MODULE
  -a,  --timeout=SECONDS           abort scanning after the given number of SECONDS
  -k,  --stack-size=SLOTS          set maximum stack size (default=16384)
  -r,  --recursive                 recursively search directories
  -f,  --fast-scan                 fast matching mode
  -w,  --no-warnings               disable warnings
       --fail-on-warnings          fail on warnings
  -v,  --version                   show version information
  -h,  --help                      show this help and exit

Send bug reports and suggestions to: vmalvarez@virustotal.com.
```

Add the following to your bash or zsh profile

```bash
alias yara='docker run -it --rm -v "$(pwd)":/malware:ro blacktop/yara $@'
```

## Documentation

### Usage

```bash
$ yara [OPTION]... RULES_FILE FILE | DIR | PID
```

## Issues

Find a bug? Want more features? Find something missing in the documentation? Let me know! Please don't hesitate to [file an issue](https://github.com/blacktop/docker-yara/issues/new) and I'll get right on it.

## License

MIT Copyright (c) 2014-2021 **blacktop**
