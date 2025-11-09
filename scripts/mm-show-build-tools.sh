#!/bin/bash

################################################################################
# This script is a convenient script for showing what the current CC, CXX, and 
# AR build tools are. If you stick to running whole scripts from the docs, 
# these should always be empty - unset at the end of specific build scripts.
#
# See licensing note at end.
################################################################################

echo "Environment build tool values:" 
echo "   CC: $CC"
echo "  CXX: $CXX"
echo "   AR: $AR"

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
