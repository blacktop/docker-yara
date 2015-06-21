![yara-logo](http://plusvic.github.io/yara/images/logo.png)
Yara Dockerfile
==================

This repository contains a **Dockerfile** of [Yara](http://plusvic.github.io/yara/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/blacktop/yara/) published to the public [Docker Registry](https://index.docker.io/).

### Dependencies

* [alpine](https://registry.hub.docker.com/_/alpine/)

### Image Size
[![](https://badge.imagelayers.io/blacktop/yara:latest.svg)](https://imagelayers.io/?images=blacktop/yara:latest 'Get your own badge on imagelayers.io')

### Image Tags
```bash
$ docker images

REPOSITORY          TAG                 VIRTUAL SIZE
blacktop/yara       latest              55.16 MB
blacktop/yara       3.4.0               55.16 MB
```

### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/blacktop/yara/) from public [Docker Registry](https://index.docker.io/): `docker pull blacktop/yara`

#### Alternatively, build an image from Dockerfile
```bash
$ docker build -t blacktop/yara github.com/blacktop/docker-yara
```
### Usage
```bash
$ docker run -i -t -v /path/to/malware:/malware:rw blacktop/yara
```
#### Output:
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

### To Run on OSX
 - Install [Homebrew](http://brew.sh)

```bash
$ brew install cask
$ brew cask install virtualbox
$ brew install docker
$ brew install docker-machine
$ docker-machine create --driver virtualbox dev
$ eval $(docker-machine env dev)
```
Add the following to your bash or zsh profile

```bash
alias yara='docker run -it --rm -v $(pwd):/malware:rw blacktop/yara $@'
```
#### Usage

```bash
$ yara [OPTION]... RULES_FILE FILE | DIR | PID
```

### Todo
- [x] Install/Run Yara
- [ ] Start Daemon and watch folder with supervisord
- [ ] Have container take a URL as input and download/scan memory dump
