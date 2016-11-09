#!/bin/bash
set -e

# update password
echo $PASSWORD | vncpasswd -f > /home/$SYSTEM_USER/.vnc/passwd
chmod 600 /home/$SYSTEM_USER/.vnc/passwd

# set ownership
chown -R $SYSTEM_USER:$SYSTEM_USER /home/$SYSTEM_USER
