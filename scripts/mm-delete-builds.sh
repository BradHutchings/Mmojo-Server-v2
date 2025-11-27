#!/bin/bash

################################################################################
# This script deletes the 400-BUILD-* directories.
#
# See licensing note at end.
################################################################################

export STARS="********************************************************************************"
printf "\n$STARS\n*\n* STARTED: mm-environment-variables.sh.\n*\n$STARS\n\n"

cd $HOME

rm -r -f $BUILD_DIR
rm -r -f $DOGPILE_BUILD_DIR

printf "\n$STARS\n*\n* FINISHED: mm-environment-variables.sh.\n*\n$STARS\n\n"

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
