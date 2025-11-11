#!/bin/bash

################################################################################
# This script deletes all of the $HOME/406-Test-CUDA* directories.
#
# See licensing note at end.
################################################################################

cd $HOME

TEST_DIR="$HOME/406-Test-CUDA*"
rm -r -f $TEST_DIR

printf "\n**********\n*\n* FINISHED: 406-Delete-CUDA-Tests.sh.\n*\n**********\n\n"

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
################################################################################`
