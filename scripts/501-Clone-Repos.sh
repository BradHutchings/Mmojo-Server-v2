#!/bin/bash

################################################################################
# This script clones these repos to set up a $BUILD_DIR:
# - llama.cpp
#   - https://github.com/ggml-org/llama.cpp
# - Google minja (for llama.cpp) - chat templates
#    - https://github.com/google/minja - 
# - cpp-httplib (for llama.cpp)- HTTPS/HTTPS server library.
#   - https://github.com/yhirose/cpp-httplib
# - miniaudio (for llama.cpp)
#   - https://github.com/mackron/miniaudio
# - stb (for llama.cpp)
#   - https://github.com/nothings/stb
# - json (for llama.cpp)
#   - https://github.com/nlohmann/json
#
# It rolls back the llama.cpp cloned repo to a recent known release where our 
# patches have been tested.
#
# Thank you to Georgi Gerganov and his team for llama.cpp! Thank you to the
# developers behind the rest of the repos for their support as well!
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME $1.\n*\n$STARS\n\n"

branding=$1

if [ "$branding" != "dogpile" ]; then
    branding=""
fi

THIS_BUILD_DIR=$BUILD_DIR
if [ "$branding" == "dogpile" ]; then
    THIS_BUILD_DIR=$DOGPILE_BUILD_DIR
fi

if [ -d "$THIS_BUILD_DIR" ]; then
    rm -r -f $THIS_BUILD_DIR
fi

echo "  Branding: $branding"
echo "cloning in: $THIS_BUILD_DIR/"
echo ""

git clone https://github.com/ggml-org/llama.cpp $THIS_BUILD_DIR
cd $THIS_BUILD_DIR
git clone https://github.com/google/minja.git google-minja
git clone https://github.com/yhirose/cpp-httplib.git cpp-httplib
git clone https://github.com/mackron/miniaudio.git miniaudio
git clone https://github.com/nothings/stb.git stb
git clone https://github.com/nlohmann/json.git nlohmann-json
cp -r $BUILD_COSMOPOLITAN_DIR/cosmocc .
cp -r $BUILD_OPENSSSL_DIR/openssl .

cd cpp-jttplib
git checkout dbd5ca4bf2da438da1c6dcd0ba7c725f7f2cc7b7
cd ..

# Roll the llama.cpp repo back to last known working.
# Up through: https://github.com/ggml-org/llama.cpp/commit/61bde8e21f4a1f9a98c9205831ca3e55457b4c78
# 61bde8e21f4a1f9a98c9205831ca3e55457b4c78 
git checkout 61bde8e21f4a1f9a98c9205831ca3e55457b4c78 

# Previous: 9810cb82476e605bef45f9c51009c9989873ff89

# To see where you're checked out:
# git log -1

cd $HOME

printf "\n$STARS\n*\n* FINISHED: $SCRIPT_NAME $1.\n*\n$STARS\n\n"

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
