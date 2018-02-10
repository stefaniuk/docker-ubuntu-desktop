[![Circle CI](https://circleci.com/gh/codeworksio/docker-ubuntu-desktop.svg?style=shield "CircleCI")](https://circleci.com/gh/codeworksio/docker-ubuntu-desktop)&nbsp;[![Size](https://images.microbadger.com/badges/image/codeworksio/ubuntu-desktop.svg)](http://microbadger.com/images/codeworksio/ubuntu-desktop)&nbsp;[![Version](https://images.microbadger.com/badges/version/codeworksio/ubuntu-desktop.svg)](http://microbadger.com/images/codeworksio/ubuntu-desktop)&nbsp;[![Commit](https://images.microbadger.com/badges/commit/codeworksio/ubuntu-desktop.svg)](http://microbadger.com/images/codeworksio/ubuntu-desktop)&nbsp;[![Docker Hub](https://img.shields.io/docker/pulls/codeworksio/ubuntu-desktop.svg)](https://hub.docker.com/r/codeworksio/ubuntu-desktop/)

Docker Ubuntu Desktop
=====================

Customised Ubuntu desktop base image.

Installation
------------

Builds of the image are available on [Docker Hub](https://hub.docker.com/r/codeworksio/ubuntu-desktop/).

    docker pull codeworksio/ubuntu-desktop

Alternatively you can build the image yourself.

    docker build --tag codeworksio/ubuntu-desktop \
        github.com/codeworksio/docker-ubuntu-desktop

Configuration
-------------

* Password is `ubuntu` for both the system user `ubuntu` and `root`
* Use `VNC_DISPLAY=":1"` to set display
* Use `VNC_RESOLUTION="1280x1024"` to set screen resolution
* Use `VNC_COLOUR_DEPTH="24"` to set colour depth

Testing
-------

    make build start log
    make stop

Then connect to `vnc://localhost:5901` using for example Safari browser or [Remmina](http://www.remmina.org/wp/) VNC client.

TODO
----

* Install [noVNC client](https://github.com/novnc/noVNC)
* Install [Xfce theme](https://wiki.xfce.org/howto/install_new_themes)
