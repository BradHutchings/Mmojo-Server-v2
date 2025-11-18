#!/bin/bash

################################################################################
# This script switches your local clone of the Mmojo Server repo to the
# work-in-progress branch, then copies all of the mm- scripts to $HOME/scripts.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n**********\n*\n* STARTED: $SCRIPT_NAME.\n*\n**********\n\n"

if [ -d "$MMOJO_SERVER_DIR" ]; then
  WD=$(pwd)
  cd $MMOJO_SERVER_DIR
  git reset --hard
  git checkout work-in-progress
  cd $WD

  # These are the scripts. They need to be executable.
  chmod a+x $MMOJO_SERVER_SCRIPTS/2*.sh
  chmod a+x $MMOJO_SERVER_SCRIPTS/3*.sh
  chmod a+x $MMOJO_SERVER_SCRIPTS/4*.sh
  chmod a+x $MMOJO_SERVER_SCRIPTS/5*.sh

  ### Links don't work - end up modifying repo files on chmod.
  cp $MMOJO_SERVER_SCRIPTS/mm-*.sh $HOME_SCRIPTS
  chmod a+x $HOME_SCRIPTS/mm-*.sh
else
  echo "The $MMOJO_SERVER_DIR directory does not exist."
fi

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
