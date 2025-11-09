#!/bin/bash

################################################################################
# This script switches your local clone of the Mmojo Server repo to the main
# branch, then copies all of the mm- scripts to $HOME/scripts.
#
# See licensing note at end.
################################################################################

if [ -d "$MMOJO_SERVER_DIR" ]; then
  cd $MMOJO_SERVER_DIR
  git checkout main
  cd $HOME

  chmod a+x $MMOJO_SERVER_SCRIPTS/2*.sh
  chmod a+x $MMOJO_SERVER_SCRIPTS/3*.sh
  chmod a+x $MMOJO_SERVER_SCRIPTS/4*.sh
  # chmod a+x $MMOJO_SERVER_SCRIPTS/5*.sh

  ### Links don't work - end up modifying repo files on chmod.
  # for FILE in $MMOJO_SERVER_SCRIPTS/mm-*.sh; do
  #  ln -sf $FILE $SCRIPTS_DIR
  # done
  cp $MMOJO_SERVER_SCRIPTS/mm-*.sh $HOME_SCRIPTS
  chmod a+x $HOME_SCRIPTS/mm-*.sh
else
  echo "The $MMOJO_SERVER_DIR directory does not exist."
fi

printf "\n**********\n*\n* FINISHED: mm-main-branch.\n*\n**********\n\n"

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
