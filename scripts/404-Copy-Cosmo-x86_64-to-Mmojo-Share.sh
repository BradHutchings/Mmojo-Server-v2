#!/bin/bash

################################################################################
# This script copies the x86_64 build of mmojo-server and mm-zipalign to the
# right place on the Mmojo Share.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

mm-mount-mmojo-share.sh

if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
  echo "Creating directories on Mmojo Share."
  sudo mkdir -p $MMOJO_SHARE_BUILDS
  sudo mkdir -p $MMOJO_SHARE_BUILDS_APE

  if [ -d "$MMOJO_SHARE_BUILDS_APE" ]; then
    echo "Copying mmojo-server-x86_64 and mm-zipalign-x86_64 to Mmojo Share."
    sudo cp -f $BUILD_DIR/$BUILD_COSMO_X86_64/bin/mmojo-server $MMOJO_SHARE_BUILDS_APE/mmojo-server-x86_64
    sudo cp -f $BUILD_DIR/$BUILD_COSMO_X86_64/bin/mm-zipalign $MMOJO_SHARE_BUILDS_APE/mm-zipalign-x86_64
  fi
fi

printf "\n$STARS\n*\n* FINISHED: $SCRIPT_NAME.\n*\n$STARS\n\n"

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
