#!/bin/bash

################################################################################
# This script updates and upgrades what's installed on your build machine.
#
# See licensing note at end.
################################################################################

sudo apt update
sudo apt upgrade -y

printf "\n**********\n*\n* FINISHED: mm-install-system-updates.sh.\n*\n**********\n\n"

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
