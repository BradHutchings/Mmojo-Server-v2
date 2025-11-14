#!/bin/bash

################################################################################
# This script copies the mmojo-server-ape build to the right place on the Mmojo
# Share.
#
# See licensing note at end.
################################################################################

mm-mount-mmojo-share.sh

if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
  sudo mkdir -p $MMOJO_SHARE_BUILDS
  sudo mkdir -p $MMOJO_SHARE_BUILDS_APE

  if [ -d "$MMOJO_SHARE_BUILDS_APE" ]; then
    echo "Copying mmojo-server-ape and mm-zipalign-ape to Mmojo Share."
    sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE/mmojo-server-ape $MMOJO_SHARE_BUILDS_APE/mmojo-server-ape
    sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_APE/mm-zipalign-ape $MMOJO_SHARE_BUILDS_APE/mm-zipalign-ape
  fi
fi

printf "\n**********\n*\n* FINISHED: 404-Copy-Cosmo-APE-to-Mmojo-Share.sh.\n*\n**********\n\n"

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
