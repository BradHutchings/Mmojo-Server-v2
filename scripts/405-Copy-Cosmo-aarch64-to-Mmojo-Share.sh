#!/bin/bash

################################################################################
# This script copies the aarch64 (arm64) build of mmojo-server and mm-zipalign 
# to the right place on the Mmojo Share.
#
# See licensing note at end.
################################################################################

mm-mount-mmojo-share.sh

# TO-DO: check that the share is mounted.
sudo mkdir -p $MMOJO_SHARE_BUILDS
sudo mkdir -p $MMOJO_SHARE_BUILDS_APE

# TO-DO: check that the $MMOJO_SHARE_BUILDS_APE directory exists.
sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_AARCH64/bin/mmojo-server $MMOJO_SHARE_BUILDS_APE/mmojo-server-aarch64
sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_AARCH64/bin/mm-zipalign $MMOJO_SHARE_BUILDS_APE/mm-zipalign-aarch64

printf "\n**********\n*\n* FINISHED: 405-Copy-Cosmo-aarch64-to-Mmojo-Share.sh.\n*\n**********\n\n"

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
