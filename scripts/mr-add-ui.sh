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
    echo "mr-add-certs.sh [RUNNER_DIR] [CERTS_PATH]"
    echo "  Adds a directory of certificates or a certificate file to the runner."
    exit 1
fi

runner_dir="$1"
ui_source_dir="$2"

# Convert $runner_dir to an absolute path.
case $runner_dir in
  ("/"*) ;;
  (*)    runner_dir="$(pwd)/$runner_dir";;
esac

# Strip a trailing "/" from $runner_dir and $ui_source_dir if either has one.
runner_dir="$(dirname $runner_dir)/$(basename $runner_dir)"
ui_source_dir="$(dirname $ui_source_dir)/$(basename $ui_source_dir)"

# source $runner_dir/vars.sh
support_directory_name="support"
vars_file="$runner_dir/vars.sh"
if [ -f "$vars_file" ]; then
    echo ""
    echo "Sourcing vars.sh"
    source $vars_file
fi

archive_zip="$runner_dir/archive.zip"
support_dir="$runner_dir/$support_directory_name"
ui_dir="$support_dir/$(basename $ui_source_dir)"

echo ""
echo "   \$runner_dir: $runner_dir"
echo "\$ui_source_dir: $ui_source_dir"
echo "  \$archive_zip: $archive_zip"
echo "  \$support_dir: $support_dir"
echo "       \$ui_dir: $ui_dir"
echo "     \$app_name: $app_name"

echo ""
echo "Copying Mmojo Complete user interface."
mkdir -p "$ui_dir"
cp -r "$ui_source_dir"/* $ui_dir

echo ""
echo "Adding user interface to $archive_zip."
cd $runner_dir
zip -u -0 "$archive_zip" "$support_directory_name/$(basename $ui_dir)"/*

echo ""
echo "Contents of $runner_dir/archive.zip:"
unzip -l "$runner_dir/archive.zip"

echo ""
echo "Files in $runner_dir:"
ls -alR "$runner_dir"

cd $HOME

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
