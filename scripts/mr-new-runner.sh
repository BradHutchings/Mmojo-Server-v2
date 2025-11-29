#!/bin/bash

################################################################################
# This script creates a directory and files to start work on a new Mmojo Runner
# archive.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME $1 $2.\n*\n$STARS\n\n"

if [ "$1" == "--help" ] || [ "$1" == "-h" ] || [ "$1" == "" ]; then
    echo "mr_new_runner.sh [RUNNER_DIR] [APP_NAME] [SUPPORT_DIR_NAME]"
    echo "  Creates a new runner directory and preamble file."
    exit 1
fi

runner_dir=$1
app_name=$2
support_directory_name=$3

# Clear out a directory that was there. Make a new one.
echo "Creating $runner_dir directory."
if [ -d "$runner_dir" ]; then
    rm -r -f "$runner_dir"
fi
mkdir -p "$runner_dir"

# Copy the mr-preamble.sh into the directory. Customize with app name.
echo ""
echo "Copying mr-preamble.sh to $runner_dir/preamble.sh.
cp "$MMOJO_SERVER_SCRIPTS/mr-preamble.sh" "$runner_dir/preamble.sh"

echo ""
echo "Customizing $runner_dir/preamble.sh."
sed -i -e "s/[APP_NAME]/$app_name/g" "$runner_dir/preamble.sh"
sed -i -e "s/[SUPPORT_DIRECTORY_NAME]/$support_directory_name/g" "$runner_dir/preamble.sh"

echo ""
echo "$runner_dir/preamble.sh:"
cat "$runner_dir/preamble.sh"

printf "\n$STARS\n*\n* FINISHED: $SCRIPT_NAME $1 $2.\n*\n$STARS\n\n"

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
