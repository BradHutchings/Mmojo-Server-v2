#!/bin/bash

################################################################################
# This script adds certs from the Mmojo Share to the mmojo-server-support
# subdirectory of the package directory.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

if [[ ! $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
  mm-mount-mmojo-share.sh
fi

if [ -v CHOSEN_BUILD ] && [ -v CHOSEN_BUILD_PATH ]; then
    THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_ZIP-$CHOSEN_BUILD_INFO"
    SUPPORT_DIR="$THIS_PACKAGE_DIR/$PACKAGE_MMOJO_SERVER_SUPPORT_DIR"

    if [ -d "$THIS_PACKAGE_DIR" ] && [ -d "$SUPPORT_DIR" ]; then
        if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
          echo "Adding certificate files."
          CERTS="$SUPPORT_DIR/certs"
          mkdir -p $CERTS
          cp $MMOJO_SHARE_MOUNT_POINT/Mmojo-certs/mmojo.local.crt $CERTS
          cp $MMOJO_SHARE_MOUNT_POINT/Mmojo-certs/mmojo.local.key  $CERTS
          cp $MMOJO_SHARE_MOUNT_POINT/Mmojo-certs/selfsignCA.crt $CERTS

          echo ""
          echo "$SUPPORT_DIR:"
          ls -al "$SUPPORT_DIR"

          echo ""
          echo "$SUPPORT_DIR/certs:"
          ls -al "$SUPPORT_DIR/certs"
fi
    fi
fi

cd $HOME

printf "\n**********\n*\n* FINISHED: $SCRIPT_NAME.\n*\n**********\n\n"

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
