#!/bin/bash

################################################################################
# This script deletes all of the test-debug subdirectories.
#
# See licensing note at end.
################################################################################

cd $HOME

rm -r -f "$TEST_LLAMA_CPP_DIR/$BUILD_DEBUG"

printf "\n**********\n*\n* FINISHED: 403-Delete-Debug-Tests.sh.\n*\n**********\n\n"

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
