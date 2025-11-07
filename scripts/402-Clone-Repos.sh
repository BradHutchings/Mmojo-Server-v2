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
