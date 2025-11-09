#!/bin/bash

################################################################################
# This script creates a /mnt/mmojo mount point for an SMB share on your network.
#
# See licensing note at end.
################################################################################

#----------------------------------------
# We need some variables. These should be
# in the mm-environment-variables.sh script.
#----------------------------------------
export SHARE_DIR="/mnt/mmojo"
export SCRIPTS_DIR="$HOME/scripts"
TILDE_SCRIPTS="~/scripts"
export MOUNT_SCRIPT="mount-mmojo-share.sh"

#----------------------------------------
# Create `/mnt/mmojo` directory.
#----------------------------------------
if [ ! -d "$SHARE_DIR" ]; then
    sudo mkdir -p $SHARE_DIR
fi

#----------------------------------------
# Create `$HOME/scripts` directory.
#----------------------------------------
if [ ! -d "$SCRIPTS_DIR" ]; then
    mkdir -p $SCRIPTS_DIR
fi

#----------------------------------------
# Create a `mount-mmojo-share.sh` script.
#----------------------------------------
cat << EOF > "$SCRIPTS_DIR/$MOUNT_SCRIPT"
if [[ ! \$(findmnt $SHARE_DIR) ]]; then
    sudo mount -t cifs -o user=[USER] //[COMPUTER]/mmojo $SHARE_DIR
fi
EOF
chmod a+x "$SCRIPTS_DIR/$MOUNT_SCRIPT"

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
