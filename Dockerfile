FROM stefaniuk/ubuntu
MAINTAINER daniel.stefaniuk@gmail.com

ARG APT_PROXY
ARG APT_PROXY_SSL
ENV HOME=/home/$SYSTEM_USER \
    USER="$SYSTEM_USER" \
    PASSWORD="default" \
    DISPLAY=":1" \
    RESOLUTION="1024x768" \
    COLOUR_DEPTH="16"

RUN set -ex \
    \
    && if [ -n "$APT_PROXY" ]; then echo "Acquire::http { Proxy \"http://${APT_PROXY}\"; };" > /etc/apt/apt.conf.d/00proxy; fi \
    && if [ -n "$APT_PROXY_SSL" ]; then echo "Acquire::https { Proxy \"https://${APT_PROXY_SSL}\"; };" > /etc/apt/apt.conf.d/00proxy; fi \
    && echo "APT::Install-Recommends 0;\nAPT::Install-Suggests 0;" >> /etc/apt/apt.conf.d/01norecommends \
    && apt-get --yes update \
    && apt-get --yes install \
        xfce4 \
        xfce4-goodies \
        xbase-clients \
        xfonts-base \
        xfonts-75dpi \
        xfonts-100dpi \
        xfonts-scalable \
        tightvncserver \
    \
    && mkdir -p $HOME/.vnc \
    && touch $HOME/.Xresources \
    && touch $HOME/.Xauthority \
    \
    # SEE: https://github.com/stefaniuk/dotfiles
    && curl -L https://raw.githubusercontent.com/stefaniuk/dotfiles/master/dotfiles -o - | /bin/bash -s -- \
        --config=bash \
        --minimal \
        --directory=$HOME \
    && chsh -s /bin/bash $SYSTEM_USER \
    \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/* \
    && rm -f /etc/apt/apt.conf.d/00proxy

WORKDIR $HOME
EXPOSE 5901-5999

COPY assets/sbin/init.d/config.sh /sbin/init.d/config.sh
COPY assets/sbin/vncserver.sh /sbin/vncserver.sh
CMD [ "/sbin/vncserver.sh" ]

### METADATA ###################################################################

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
LABEL \
    version=$VERSION \
    build-date=$BUILD_DATE \
    vcs-ref=$VCS_REF \
    vcs-url=$VCS_URL \
    license="MIT"
