#!/bin/bash
set -e

# generate password
echo $PASSWORD | vncpasswd -f > $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd

# set ownership
chown -R $SYSTEM_USER:$SYSTEM_USER $HOME
