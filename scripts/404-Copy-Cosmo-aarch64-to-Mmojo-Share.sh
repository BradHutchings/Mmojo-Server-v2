#!/bin/bash

################################################################################
# This script copies the aarch64 (arm64) build of mmojo-server and mm-zipalign 
# to the right place on the Mmojo Share.
#
# See licensing note at end.
################################################################################

mm-mount-mmojo-share.sh

if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
  sudo mkdir -p $MMOJO_SHARE_BUILDS
  sudo mkdir -p $MMOJO_SHARE_BUILDS_APE

  if [ -d "$MMOJO_SHARE_BUILDS_APE" ]; then
    echo "Copying mmojo-server-aarch64 and mm-zipalign-aarch64 to Mmojo Share."
    sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_AARCH64/bin/mmojo-server $MMOJO_SHARE_BUILDS_APE/mmojo-server-aarch64
    sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_AARCH64/bin/mm-zipalign $MMOJO_SHARE_BUILDS_APE/mm-zipalign-aarch64
  fi
fi

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* FINISHED: $SCRIPT_NAME.\n*\n**********\n\n"
# printf "\n**********\n*\n* FINISHED: 404-Copy-Cosmo-aarch64-to-Mmojo-Share.sh.\n*\n**********\n\n"

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
