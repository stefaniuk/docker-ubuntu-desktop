FROM stefaniuk/ubuntu:16.04-20170118

ARG APT_PROXY
ARG APT_PROXY_SSL
ENV DISPLAY=":1" \
    RESOLUTION="1280x1024" \
    COLOUR_DEPTH="24" \
    PASSWORD="default"

RUN set -ex \
    \
    && if [ -n "$APT_PROXY" ]; then echo "Acquire::http { Proxy \"http://${APT_PROXY}\"; };" > /etc/apt/apt.conf.d/00proxy; fi \
    && if [ -n "$APT_PROXY_SSL" ]; then echo "Acquire::https { Proxy \"https://${APT_PROXY_SSL}\"; };" > /etc/apt/apt.conf.d/00proxy; fi \
    && apt-get --yes update \
    && apt-get --yes upgrade \
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
    && mkdir -p /home/$SYSTEM_USER/.vnc \
    && touch /home/$SYSTEM_USER/.Xresources \
    && touch /home/$SYSTEM_USER/.Xauthority \
    \
    # SEE: https://github.com/stefaniuk/dotfiles
    && curl -L https://raw.githubusercontent.com/stefaniuk/dotfiles/master/dotfiles -o - | /bin/bash -s -- \
        --config=bash \
        --minimal \
        --directory=/home/$SYSTEM_USER \
    && chown -R $SYSTEM_USER:$SYSTEM_USER /home/$SYSTEM_USER \
    && chsh -s /bin/bash $SYSTEM_USER \
    \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/* \
    && rm -f /etc/apt/apt.conf.d/00proxy

WORKDIR /home/$SYSTEM_USER
EXPOSE 5901-5999

COPY assets/home/.config /home/$SYSTEM_USER/.config
COPY assets/sbin/bootstrap.sh /sbin/bootstrap.sh
COPY assets/sbin/init.sh /sbin/init.sh
CMD [ "/sbin/init.sh" ]

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
