#!/bin/bash

if [ -d "$BUILD_LLAMA_CPP_DIR" ]; then
    rm -r -f $BUILD_LLAMA_CPP_DIR
fi

git clone https://github.com/ggml-org/llama.cpp $BUILD_LLAMA_CPP_DIR
cd $BUILD_LLAMA_CPP_DIR
git clone https://github.com/nlohmann/json.git nlohmann-json
git clone https://github.com/google/minja.git google-minja
git clone https://github.com/yhirose/cpp-httplib.git cpp-httplib
git clone https://github.com/mackron/miniaudio.git miniaudio
git clone https://github.com/nothings/stb.git stb
cp -r ~/$BUILD_COSMOPOLITAN_DIR/cosmocc .
cp -r ~/$BUILD_OPENSSSL_DIR/openssl .

# Roll the llama.cpp repo back to last known working.
# Should we track to releases on the repo? No ides.
echo "\n--------------------------------------------------------------------------------"
echo "TO DO: Roll back llama.cpp to a known safe point."
echo "--------------------------------------------------------------------------------"

printf "\n**********\n*\n* FINISHED: 402-Clone-Repos.sh.\n*\n**********\n\n"
