#!/bin/bash

################################################################################
# This script updates your local clone of the Mmojo Server repo, then copies
# all of the mm- scripts to $HOME/scripts.
#
# See licensing note at end.
################################################################################

WD=$(pwd)
cd $MMOJO_SERVER_DIR
git reset --hard
git pull
cd $WD

chmod a+x $MMOJO_SERVER_SCRIPTS/2*.sh
chmod a+x $MMOJO_SERVER_SCRIPTS/3*.sh
chmod a+x $MMOJO_SERVER_SCRIPTS/4*.sh
# chmod a+x $MMOJO_SERVER_SCRIPTS/5*.sh

### Links don't work - end up modifying repo files on chmod.
# for FILE in $MMOJO_SERVER_SCRIPTS/mm-*.sh; do
#  ln -sf $FILE $HOME_SCRIPTS
# done
cp $MMOJO_SERVER_SCRIPTS/mm-*.sh $HOME_SCRIPTS
chmod a+x $HOME_SCRIPTS/mm-*.sh

printf "\n**********\n*\n* FINISHED: mm-update-local-mmojo-server-repo.sh.\n*\n**********\n\n"

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
