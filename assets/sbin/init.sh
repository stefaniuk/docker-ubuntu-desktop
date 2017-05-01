#!/bin/bash
set -e

# clean up
vncserver -kill :1 > /dev/null 2>&1 ||:
rm -rf /tmp/.X*
rm -f /home/$SYSTEM_USER/.vnc/*.log

# start VNC
USER=$SYSTEM_USER vncserver $VNC_DISPLAY -geometry $VNC_RESOLUTION -depth $VNC_COLOUR_DEPTH

# print log
tail -F /home/$SYSTEM_USER/.vnc/*$VNC_DISPLAY.log
