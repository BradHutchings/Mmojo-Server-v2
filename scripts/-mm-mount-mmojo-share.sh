#!/bin/bash

################################################################################
# This script mounts the Mmojo Share on your network. It is usually run as
# needed by scripts that want to copy to/from the Mmojo Share.
#
#
# See licensing note at end.
################################################################################

# Setup step: Replace [HOST] and [USER] with your Mmojo Share's hostname and user.
HOST="[HOST]"
USER="[USER]"
SHARE="mmojo"

RUNNING_IN_WSL=0
if [[ $(uname -r) =~ Microsoft|WSL ]]; then
    RUNNING_IN_WSL=1
fi

if [[ ! $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
    if [ $RUNNING_IN_WSL ]; then
        echo "Mounting Mmojo Share as drvfs. You may be prompted for your share password."
        sudo mount -t drvfs -o user=$USER "\\\\$HOST\\$SHARE" $MMOJO_SHARE_MOUNT_POINT
    else
        echo "Mounting Mmojo Share as cifs. You may be prompted for your share password."
        sudo mount -t cifs -o user=$USER //$HOST/$SHARE $MMOJO_SHARE_MOUNT_POINT
    fi
fi
