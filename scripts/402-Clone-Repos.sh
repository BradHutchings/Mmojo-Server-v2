#!/bin/bash

################################################################################
# This script clones these repos to set up a $BUILD_LLAMA_CPP_DIR:
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

if [ -d "$BUILD_LLAMA_CPP_DIR" ]; then
    rm -r -f $BUILD_LLAMA_CPP_DIR
fi

git clone https://github.com/ggml-org/llama.cpp $BUILD_LLAMA_CPP_DIR
cd $BUILD_LLAMA_CPP_DIR
git clone https://github.com/google/minja.git google-minja
git clone https://github.com/yhirose/cpp-httplib.git cpp-httplib
git clone https://github.com/mackron/miniaudio.git miniaudio
git clone https://github.com/nothings/stb.git stb
git clone https://github.com/nlohmann/json.git nlohmann-json
cp -r $BUILD_COSMOPOLITAN_DIR/cosmocc .
cp -r $BUILD_OPENSSSL_DIR/openssl .

# Roll the llama.cpp repo back to last known working.
# Up through: https://github.com/ggml-org/llama.cpp/pull/16919
# a44d77126c911d105f7f800c17da21b2a5b112d1 
git checkout a44d77126c911d105f7f800c17da21b2a5b112d1 

# To see where you're checked out:
# git log -1

cd $HOME

printf "\n**********\n*\n* FINISHED: 402-Clone-Repos.sh.\n*\n**********\n\n"

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
