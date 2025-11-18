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

cd "$PACKAGE_DIR/$PACKAGE_APE"
cat << EOF > $PACKAGE_DEFAULT_ARGS_FILE
--host
127.0.0.1
--port
8080
--ctx-size
0
--threads-http
8
--batch-size
64
--batch-sleep-ms
0
EOF

if [ $ADDED_CERTS ]; then
cat << EOF >> $PACKAGE_DEFAULT_ARGS_FILE
--ssl-key-file
/zip/certs/mmojo.local.key
--ssl-cert-file
/zip/certs/mmojo.local.crt
EOF
fi

if [ $ADDED_MMOJO_COMPLETE ]; then
cat << EOF >> $PACKAGE_DEFAULT_ARGS_FILE
--path
/zip/website
--default-ui-endpoint
chat
EOF
fi

if [ $ADDED_MODEL ]; then
cat << EOF >> $PACKAGE_DEFAULT_ARGS_FILE
--model
SELECTED_MODEL
EOF
fi

cat << EOF >> $PACKAGE_DEFAULT_ARGS_FILE
...
EOF

echo "$PACKAGE_DEFAULT_ARGS_FILE:"
cat $PACKAGE_DEFAULT_ARGS_FILE

echo "Zipping contents of $PACKAGE_DEFAULT_ARGS_FILE"
zip -0 -r $PACKAGING_ZIP_FILE $PACKAGE_DEFAULT_ARGS_FILE

echo ""
echo "Contents of $PACKAGE_MMOJO_SERVER_APE_FILE:"
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
