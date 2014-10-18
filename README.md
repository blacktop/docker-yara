![yara-logo](http://plusvic.github.io/yara/images/logo.png)
Yara Dockerfile
==================

This repository contains a **Dockerfile** of [Yara](http://plusvic.github.io/yara/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/blacktop/yara/) published to the public [Docker Registry](https://index.docker.io/).

### Dependencies

* [debian:wheezy](https://index.docker.io/_/debian/)


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
```bash

```

### Todo
- [x] Install/Run Yara
- [ ] Start Daemon and watch folder with supervisord
- [ ] Have container take a URL as input and download/scan memory dump
