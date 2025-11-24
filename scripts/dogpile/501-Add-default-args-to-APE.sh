#!/bin/bash

################################################################################
# This script creates a default_args file and adds it to the dogpile APE file.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

THIS_PACKAGE_DIR="$DOGPILE_PACKAGE_DIR/$PACKAGE_APE"
if [ -v CHOSEN_MODEL_SHORT_NAME ]; then
    THIS_PACKAGE_DIR+="-$CHOSEN_MODEL_SHORT_NAME"
fi

ZIP_FILE="$THIS_PACKAGE_DIR/$PACKAGE_DOGPILE_ZIP_FILE"

cd "$THIS_PACKAGE_DIR"
cat << EOF > $PACKAGE_DEFAULT_ARGS_FILE
--no-mmap
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

# Memory mapping through Coscmo libc does not work. If we add a model, make sure we don't use mmap.
# We need an enable mmap paramter to override this.

if [ $ADDED_MODEL ] && [ -v CHOSEN_MODEL ]; then
cat << EOF >> $PACKAGE_DEFAULT_ARGS_FILE
--no-mmap
--model
/zip/$CHOSEN_MODEL
EOF
fi

cat << EOF >> $PACKAGE_DEFAULT_ARGS_FILE
...
EOF

echo "$PACKAGE_DEFAULT_ARGS_FILE:"
cat $PACKAGE_DEFAULT_ARGS_FILE

echo "Zipping contents of $PACKAGE_DEFAULT_ARGS_FILE"
zip -0 -r $ZIP_FILE $PACKAGE_DEFAULT_ARGS_FILE

echo ""
echo "Contents of $ZIP_FILE:"
unzip -l $ZIP_FILE 

echo ""
echo "Cleaning up."
mv $ZIP_FILE $PACKAGE_DOGPILE_FILE
rm -r -f Mmojo-Complete certs $PACKAGE_DEFAULT_ARGS_FILE

echo ""
echo "Listing packaging directory: $THIS_PACKAGE_DIR"
ls -al $THIS_PACKAGE_DIR

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
