![YARA-logo](https://raw.githubusercontent.com/blacktop/docker-yara/master/logo.png)

Yara Dockerfile
===============

[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)[![Docker Stars](https://img.shields.io/docker/stars/blacktop/yara.svg)](https://hub.docker.com/r/blacktop/yara/)[![Docker Pulls](https://img.shields.io/docker/pulls/blacktop/yara.svg)](https://hub.docker.com/r/blacktop/yara/)[![Image Size](https://img.shields.io/imagelayers/image-size/blacktop/yara/latest.svg)](https://imagelayers.io/?images=blacktop/yara:latest)[![Image Layers](https://img.shields.io/imagelayers/layers/blacktop/yara/latest.svg)](https://imagelayers.io/?images=blacktop/yara:latest)

This repository contains a **Dockerfile** of [Yara](http://virustotal.github.io/yara/).

### Dependencies

-	[gliderlabs/alpine](https://hub.docker.com/_/gliderlabs/alpine/)

### Image Tags

```bash
$ docker images

REPOSITORY          TAG                 VIRTUAL SIZE
blacktop/yara       latest              57    MB
blacktop/yara       3.4.0               57    MB
blacktop/yara       3.4.0_no_python     17    MB
blacktop/yara       3.1.0               163.7 MB (debian:jessie)
```

### Installation

1.	Install [Docker](https://www.docker.io/).
2.	Download [trusted build](https://hub.docker.com/u/blacktop/yara/) from public [Docker Registry](https://hub.docker.com/): `docker pull blacktop/yara`

### Usage

```bash
$ docker run --rm -v /path/to/rules:/rules:ro \
                  -v /path/to/malware:/malware:ro \
                  blacktop/yara /rules/RULES_FILE FILE
```

#### Output:

```
YARA 3.4.0, the pattern matching swiss army knife.
Usage: yara [OPTION]... RULES_FILE FILE | DIR | PID

Mandatory arguments to long options are mandatory for short options too.

  -t,  --tag=TAG                   print only rules tagged as TAG
  -i,  --identifier=IDENTIFIER     print only rules named IDENTIFIER
  -n,  --negate                    print only not satisfied rules (negate)
  -D,  --print-module-data         print module data
  -g,  --print-tags                print tags
  -m,  --print-meta                print metadata
  -s,  --print-strings             print matching strings
  -e,  --print-namespace           print rules' namespace
  -p,  --threads=NUMBER            use the specified NUMBER of threads to scan a directory
  -l,  --max-rules=NUMBER          abort scanning after matching a NUMBER of rules
  -d VAR=VALUE                     define external variable
  -x MODULE=FILE                   pass FILE's content as extra data to MODULE
  -a,  --timeout=SECONDS           abort scanning after the given number of SECONDS
  -r,  --recursive                 recursively search directories
  -f,  --fast-scan                 fast matching mode
  -w,  --no-warnings               disable warnings
  -v,  --version                   show version information
  -h,  --help                      show this help and exit

Send bug reports and suggestions to: vmalvarez@virustotal.com.
```

Add the following to your bash or zsh profile

```bash
alias yara='docker run -it --rm -v $(pwd):/malware:ro blacktop/yara $@'
```

#### Usage

```bash
$ yara [OPTION]... RULES_FILE FILE | DIR | PID
```
