#!/bin/bash

################################################################################
# This script deletes all of the $HOME/403-CPU-Test-* directories.
#
# See licensing note at end.
################################################################################

cd $HOME

TEST_DIR="$HOME/403-Test-CPU-Only-*"
rm -r -f $TEST_DIR

printf "\n**********\n*\n* FINISHED: 403-Delete-CPU-Only-Tests.sh.\n*\n**********\n\n"

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
