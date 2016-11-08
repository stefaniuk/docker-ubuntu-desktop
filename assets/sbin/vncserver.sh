#!/bin/bash
set -e

# clean up
vncserver -kill :1 > /dev/null 2>&1 ||:
rm -rf /tmp/.X*
rm -f $HOME/.vnc/*.log

# start VNC
vncserver $DISPLAY -geometry $RESOLUTION -depth $COLOUR_DEPTH

# print log
tail -F $HOME/.vnc/*$DISPLAY.log
