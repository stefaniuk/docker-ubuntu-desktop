[![Circle CI](https://circleci.com/gh/stefaniuk/docker-ubuntu-desktop.svg?style=shield "CircleCI")](https://circleci.com/gh/stefaniuk/docker-ubuntu-desktop)&nbsp;[![Size](https://images.microbadger.com/badges/image/stefaniuk/ubuntu-desktop.svg)](http://microbadger.com/images/stefaniuk/ubuntu-desktop)&nbsp;[![Version](https://images.microbadger.com/badges/version/stefaniuk/ubuntu-desktop.svg)](http://microbadger.com/images/stefaniuk/ubuntu-desktop)&nbsp;[![Commit](https://images.microbadger.com/badges/commit/stefaniuk/ubuntu-desktop.svg)](http://microbadger.com/images/stefaniuk/ubuntu-desktop)&nbsp;[![Docker Hub](https://img.shields.io/docker/pulls/stefaniuk/ubuntu-desktop.svg)](https://hub.docker.com/r/stefaniuk/ubuntu-desktop/)

Docker Ubuntu Desktop
=====================

My customised Ubuntu desktop baseimage.

Installation
------------

Builds of the image are available on [Docker Hub](https://hub.docker.com/r/stefaniuk/ubuntu-desktop/).

    docker pull stefaniuk/ubuntu-desktop

Alternatively you can build the image yourself.

    docker build --tag stefaniuk/ubuntu-desktop \
        github.com/stefaniuk/docker-ubuntu-desktop

Testing
-------

    make build create start log

Then connect to `vnc://localhost:5901` using for example [Remmina](http://www.remmina.org/wp/) VNC client. The default password is `default`.

TODO
----

 * Configure Xfce Desktop Environment
