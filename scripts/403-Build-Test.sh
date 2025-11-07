#!/bin/bash

cd $BUILD_LLAMA_CPP_DIR
if [ "$BUILD_PROFILE" ]; then
    export CC="cc -pg "
    export CXX="c++ -pg "
fi

cmake -B $BUILD_TEST -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON
cmake --build $BUILD_TEST --config Release

printf "\n**********\n*\n* FINISHED: 403-Build-Test.sh.\n*\n**********\n\n"
