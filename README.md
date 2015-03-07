![yara-logo](http://plusvic.github.io/yara/images/logo.png)
Yara Dockerfile
==================

This repository contains a **Dockerfile** of [Yara](http://plusvic.github.io/yara/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/blacktop/yara/) published to the public [Docker Registry](https://index.docker.io/).

### Dependencies

* [debian:wheezy](https://index.docker.io/_/debian/)

### Image Sizes
| Image | Virtual Size | Yara 3.3.0| TOTAL     |
|:------:|:-----------:|:---------:|:---------:|
| debian | 85.1 MB     | 238.5 MB  | 323.6 MB  |

### Image Tags
```bash
$ docker images

REPOSITORY          TAG                 VIRTUAL SIZE
blacktop/yara       latest              323.8 MB
blacktop/yara       3.3.0               323.8 MB
blacktop/yara       3.2.0               323.6 MB
blacktop/yara       3.1.0               315.8 MB
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
    usage:  yara [OPTION]... RULES_FILE FILE | PID
    options:
      -t <tag>                 only print rules tagged as <tag>.
      -i <identifier>          only print rules named <identifier>.
      -n                       only print not satisfied rules (negate).
      -g                       print tags.
      -m                       print metadata.
      -s                       print matching strings.
      -p <number>              use the specified <number> of threads to scan a directory.
      -l <number>              abort scanning after matching a number rules.
      -a <seconds>             abort scanning after a number of seconds has elapsed.
      -d <identifier>=<value>  define external variable.
      -x <module>=<file>       pass file's content as extra data to module.
      -r                       recursively search directories.
      -f                       fast matching mode.
      -w                       disable warnings.
      -v                       show version information.

    Report bugs to: <vmalvarez@virustotal.com>

### To Run on OSX
 - Install [Homebrew](http://brew.sh)

```bash
$ brew install cask
$ brew cask install virtualbox
$ brew install docker
$ brew install boot2docker
$ boot2docker up
```
Add the following to your bash or zsh profile

```bash
alias yara='docker run -it --rm -v $(pwd):/malware:rw blacktop/yara $@'
```
#### Usage

```bash
$ yara [OPTIONS] RULES_FILE TARGET
```

### Todo
- [x] Install/Run Yara
- [ ] Start Daemon and watch folder with supervisord
- [ ] Have container take a URL as input and download/scan memory dump
