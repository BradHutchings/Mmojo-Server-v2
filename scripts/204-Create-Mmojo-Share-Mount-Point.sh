#!/bin/bash

################################################################################
# This script creates a /mnt/mmojo mount point for an SMB share on your network.
#
# See licensing note at end.
################################################################################

#----------------------------------------
# Create mpount point: /mnt/mmojo
#----------------------------------------
if [ ! -d "$MMOJO_SHARE_MOUNT_POINT" ]; then
    sudo mkdir -p $MMOJO_SHARE_MOUNT_POINT
fi

#----------------------------------------
# Create a `mm-mount-mmojo-share.sh` script.
#----------------------------------------
cat << EOF > "$HOME_SCRIPTS/$MOUNT_MMOJO_SHARE_SCRIPT"
if [[ ! \$(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
    sudo mount -t cifs -o user=[USER] //[COMPUTER]/mmojo $MMOJO_SHARE_MOUNT_POINT
fi
EOF
chmod a+x "$HOME_SCRIPTS/$MOUNT_MMOJO_SHARE_SCRIPT"

################################################################################
#  This is an original script for the Mmojo Server repo. It is covered by
#  the repo's MIT-style LICENSE:
#
#  https://github.com/BradHutchings/Mmojo-Server/blob/main/LICENSE
#
#  Copyright (c) 2025 Brad Hutchings.
#  --
#  Brad Hutchings
#  brad@bradhutchings.com
################################################################################
