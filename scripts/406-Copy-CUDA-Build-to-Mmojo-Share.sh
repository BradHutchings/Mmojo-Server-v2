#!/bin/bash

################################################################################
# This script copies the CUDA build of mmojo-server to the right place on the 
# Mmojo Share.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

mm-mount-mmojo-share.sh

if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
  echo "Creating directories on Mmojo Share."
  sudo mkdir -p $MMOJO_SHARE_BUILDS
  sudo mkdir -p $MMOJO_SHARE_BUILDS_CUDA

  # TO-DO: What CPU options/level?
  ARCH=$(uname -m)

  if [ -d "$MMOJO_SHARE_BUILDS_CUDA" ]; then
    echo "Copying mmojo-server-cuda-$ARCH to Mmojo Share."
    sudo cp -f $BUILD_DIR/$BUILD_CUDA/bin/mmojo-server $MMOJO_SHARE_BUILDS_CUDA/mmojo-server-cuda-$ARCH
  fi
fi

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
