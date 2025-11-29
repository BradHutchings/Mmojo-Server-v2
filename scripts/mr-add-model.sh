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

runner_dir="$1"
model_file="$2"

# Convert $runner_dir to an absolute path.
case $runner_dir in
  ("/"*) ;;
  (*)    runner_dir="$(pwd)/$runner_dir";;
esac

archive_zip="$runner_dir/archive.zip"
models_dir="$runner_dir/models"

echo ""
echo " \$runner_dir: $runner_dir"
echo " \$model_file: $model_file"
echo "\$archive_zip: $archive_zip"
echo " \$models_dir: $models_dir"

if [ -d $runner_dir ] && [ -f "$archive_zip" ] && [-d "$models_dir" ] && [ -f $model_file ]; then
    echo ""
    echo "Copying $model_file to $models_dir."
    cp "$model_file" "$models_dir"

    echo ""
    echo "Adding $(basename $model_file) to $archive_zip."
    SAVE_DIR=$(pwd)
    cd "$runner_dir"
    zip -u -0 "$archive_zip" "models/$(basename $model_file)"
fi

echo ""
echo "Contents of $runner_dir/archive.zip:"
unzip -l "$runner_dir/archive.zip"

echo ""
echo "Files in $runner_dir:"
ls -al "$runner_dir"

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
