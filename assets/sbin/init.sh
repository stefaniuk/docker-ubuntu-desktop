#!/bin/bash
set -e

# start VNC server
vncserver -kill :1 > /dev/null 2>&1 ||:
rm -rf /tmp/.X*
rm -f /home/$SYSTEM_USER/.vnc/*.log
USER=$SYSTEM_USER vncserver $VNC_DISPLAY -geometry $VNC_RESOLUTION -depth $VNC_COLOUR_DEPTH

exec tail -F /home/$SYSTEM_USER/.vnc/*$VNC_DISPLAY.log
