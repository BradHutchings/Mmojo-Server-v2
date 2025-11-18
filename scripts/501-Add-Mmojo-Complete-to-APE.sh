#!/bin/bash

################################################################################
# This script adds certs from the Mmojo Share to the mmojo-server.zip packaging
# file.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

PACKAGING_ZIP_FILE="$PACKAGE_DIR/$PACKAGE_APE/$PACKAGE_MMOJO_SERVER_ZIP_FILE"
WEBSITE="$PACKAGE_DIR/$PACKAGE_APE/Mmojo-Complete"
mkdir -p $WEBSITE
cp -r $BUILD_DIR/Mmojo-Complete/* $WEBSITE

CA_FILE="$PACKAGE_DIR/$PACKAGE_APE/certs/selfsignCA.crt"
if [ -f "$CA_FILE" ]; then
  cp $CA_FILE $WEBSITE/CA.crt
fi

cd $PACKAGE_DIR/$PACKAGE_APE
zip -0 -r $PACKAGING_ZIP_FILE Mmojo-Complete/*

echo ""
echo "Contents of $PACKAGING_ZIP_FILE:"
unzip -l $PACKAGING_ZIP_FILE 

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
