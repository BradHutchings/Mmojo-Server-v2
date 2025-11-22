#!/bin/bash

################################################################################
# This script adds certs from the Mmojo Share to the mmojo-server.zip packaging
# file.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

THIS_PACKAGE_DIR="$PACKAGE_DIR/$PACKAGE_APE"
if [ -v CHOSEN_MODEL_SHORT_NAME ]; then
    THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_SHORT_NAME"
fi

ZIP_FILE="$THIS_PACKAGE_DIR/$PACKAGE_MMOJO_SERVER_ZIP_FILE"

if [[ ! $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
  mm-mount-mmojo-share.sh
fi

if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
  CERTS="$THIS_PACKAGE_DIR/certs"
  mkdir -p $CERTS
  cp $MMOJO_SHARE_MOUNT_POINT/Mmojo-certs/mmojo.local.crt $CERTS
  cp $MMOJO_SHARE_MOUNT_POINT/Mmojo-certs/mmojo.local.key  $CERTS
  cp $MMOJO_SHARE_MOUNT_POINT/Mmojo-certs/selfsignCA.crt $CERTS

  cd $THIS_PACKAGE_DIR
  zip -0 -r -q $ZIP_FILE certs/*
fi

echo ""
echo "Contents of $ZIP_FILE:"
unzip -l $ZIP_FILE 

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
