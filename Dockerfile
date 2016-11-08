FROM stefaniuk/ubuntu
MAINTAINER daniel.stefaniuk@gmail.com

ARG APT_PROXY
ARG APT_PROXY_SSL

ENV SYSTEM_USER_PASSWORD="password"

RUN set -ex \
    \
    && if [ -n "$APT_PROXY" ]; then echo "Acquire::http { Proxy \"http://${APT_PROXY}\"; };" > /etc/apt/apt.conf.d/00proxy; fi \
    && if [ -n "$APT_PROXY_SSL" ]; then echo "Acquire::https { Proxy \"https://${APT_PROXY_SSL}\"; };" > /etc/apt/apt.conf.d/00proxy; fi \
    && echo "APT::Install-Recommends 0;\nAPT::Install-Suggests 0;" >> /etc/apt/apt.conf.d/01norecommends \
    && apt-get --yes update \
    && apt-get --yes install \
        lxde-core \
        lxterminal \
        tightvncserver \
        xfonts-base \
    \
    && mkdir -p /home/$SYSTEM_USER/.vnc \
    && touch /home/$SYSTEM_USER/.Xresources \
    && touch /home/$SYSTEM_USER/.Xauthority \
    && echo $SYSTEM_USER_PASSWORD | vncpasswd -f > /home/$SYSTEM_USER/.vnc/passwd \
    && chmod 600 /home/$SYSTEM_USER/.vnc/passwd \
    && chown -R $SYSTEM_USER:$SYSTEM_USER /home/$SYSTEM_USER/.vnc \
    \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/* \
    && rm -f /etc/apt/apt.conf.d/00proxy

EXPOSE 5901

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
