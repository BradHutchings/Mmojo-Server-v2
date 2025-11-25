#!/bin/bash

################################################################################
# This script copies the packaged APE version of Mmojo Server to the Mmojo
# Share.
#
# https://github.com/ggml-org/llama.cpp
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

if [[ ! $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
    mm-mount-mmojo-share.sh
fi

THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_PERFORMANT_APE"
if [ -v CHOSEN_MODEL_SHORT_NAME ]; then
    THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_SHORT_NAME"
fi

if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
  echo "Creating directories on Mmojo Share."
  sudo mkdir -p $MMOJO_SHARE_PACKAGES
  sudo mkdir -p $MMOJO_SHARE_PACKAGES_PERFORMANT_APE

  if [ -d "$MMOJO_SHARE_PACKAGES_PERFORMANT_APE" ]; then
    echo "Copying mmojo-server to Mmojo Share."
    sudo cp -f $THIS_PACKAGE_DIR/$PACKAGE_MMOJO_SERVER_FILE $MMOJO_SHARE_PACKAGES_PERFORMANT_APE/$PACKAGE_MMOJO_SERVER_FILE
    sudo cp -f $THIS_PACKAGE_DIR/$PACKAGE_MMOJO_SERVER_FILE $MMOJO_SHARE_PACKAGES_PERFORMANT_APE/$PACKAGE_MMOJO_SERVER_EXE_FILE
  fi
fi

cd $HOME

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
