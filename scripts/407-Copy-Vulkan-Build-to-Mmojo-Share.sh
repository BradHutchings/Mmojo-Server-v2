#!/bin/bash

################################################################################
# This script copies the Vulkan build of mmojo-server to the right place on the 
# Mmojo Share.
#
# See licensing note at end.
################################################################################

mm-mount-mmojo-share.sh

if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
  sudo mkdir -p $MMOJO_SHARE_BUILDS
  sudo mkdir -p $MMOJO_SHARE_BUILDS_VULKAN

  # TO-DO: What CPU options/level?
  ARCH=$(uname -m)

  if [ -d "$MMOJO_SHARE_BUILDS_VULKAN" ]; then
    echo "Copying mmojo-server-vulkan-$ARCH to Mmojo Share."
    sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_VULKAN/bin/mmojo-server $MMOJO_SHARE_BUILDS_VULKAN/mmojo-server-vulkan-$ARCH
  fi
fi

printf "\n**********\n*\n* FINISHED: 407-Copy-Vulkan-Build-to-Mmojo-Share.sh.\n*\n**********\n\n"

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
