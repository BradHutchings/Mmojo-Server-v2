#!/bin/bash

################################################################################
# This script clones these repos to set up a $CONVERT_MODELS_DIR:
# - llama.cpp
#   - https://github.com/ggml-org/llama.cpp
#
# Thank you to Georgi Gerganov and his team for llama.cpp! Thank you to the
# developers behind the rest of the repos for their support as well!
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

if [ -d "$CONVERT_MODELS_DIR" ]; then
    rm -r -f $CONVERT_MODELS_DIR
fi

echo "cloning in: $CONVERT_MODELS_DIR/"
echo ""

git clone https://github.com/ggml-org/llama.cpp $CONVERT_MODELS_DIR
cd $CONVERT_MODELS_DIR

# git clone https://github.com/google/minja.git google-minja
# git clone https://github.com/yhirose/cpp-httplib.git cpp-httplib
# git clone https://github.com/mackron/miniaudio.git miniaudio
# git clone https://github.com/nothings/stb.git stb
# git clone https://github.com/nlohmann/json.git nlohmann-json
# cp -r $BUILD_COSMOPOLITAN_DIR/cosmocc .
# cp -r $BUILD_OPENSSSL_DIR/openssl .

# Roll the llama.cpp repo back to last known working.
# Up through: https://github.com/ggml-org/llama.cpp/commit/61bde8e21f4a1f9a98c9205831ca3e55457b4c78
# 61bde8e21f4a1f9a98c9205831ca3e55457b4c78 
# git checkout 61bde8e21f4a1f9a98c9205831ca3e55457b4c78 

# Previous: 9810cb82476e605bef45f9c51009c9989873ff89

# To see where you're checked out:
# git log -1

cd $HOME

printf "\n$STARS\n*\n* FINISHED: $SCRIPT_NAME.\n*\n$STARS\n\n"

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
