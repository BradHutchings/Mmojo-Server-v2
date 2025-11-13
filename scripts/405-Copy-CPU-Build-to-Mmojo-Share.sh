#!/bin/bash

################################################################################
# This script copies the x86_64 build of mmojo-server and mm-zipalign to the
# right place on the Mmojo Share.
#
# See licensing note at end.
################################################################################

mm-mount-mmojo-share.sh

# TO-DO: check that the share is mounted.
sudo mkdir -p $MMOJO_SHARE_BUILDS
sudo mkdir -p $MMOJO_SHARE_BUILDS_APE

# TO-DO: check that the $MMOJO_SHARE_BUILDS_APE directory exists.
# TO-DO: figure out which CPU this is.
sudo cp -f $BUILD_LLAMA_CPP_DIR/$BUILD_CPU/bin/mmojo-server $MMOJO_SHARE_BUILDS/$BUILD_CPU/mmojo-server-cpu

printf "\n**********\n*\n* FINISHED: 404-Copy-Cosmo-x86_64-to-Mmojo-Share.sh.\n*\n**********\n\n"

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
