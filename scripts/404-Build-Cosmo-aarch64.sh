#!/bin/bash

cd $BUILD_LLAMA_CPP_DIR

export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
export CC="aarch64-unknown-cosmo-cc -I$(pwd)/cosmocc/include -L$(pwd)/cosmocc/lib \
    -DCOSMOCC=1 -nostdinc -O3 "
export CXX="aarch64-unknown-cosmo-c++ -I$(pwd)/cosmocc/include \
    -DCOSMOCC=1 -nostdinc -nostdinc++ -O3 -Wno-format-truncation \
    -I$(pwd)/cosmocc/include/third_party/libcxx \
    -I$(pwd)/cosmocc/include/third_party/libcxx \
    -I$(pwd)/openssl/include \
    -L$(pwd)/cosmocc/lib -L$(pwd)/openssl/.aarch64/"
export AR="cosmoar"

# Make temporary change to CMake system so we link in static OpenSSL.
cp common/CMakeLists.txt common/CMakeLists-orig.txt
sed -i -e 's/PUBLIC OpenSSL::SSL OpenSSL::Crypto/PUBLIC libssl.a libcrypto.a/g' common/CMakeLists.txt

# Prepare the build folder
rm -r -f $BUILD_LLAMA_CPP_DIR/$BUILD_COSMO_AARCH64
cmake -B $BUILD_COSMO_AARCH64 -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_SYSTEM_PROCESSOR=aarch64 -DCOSMOCC=1

# Revert to original CMake system.
mv common/CMakeLists-orig.txt common/CMakeLists.txt

# Build
cmake --build $BUILD_COSMO_AARCH64 --config Release

export PATH=$SAVE_PATH
unset CC
unset CXX
unset AR

cd $HOME

printf "\n**********\n*\n* FINISHED: 404-Build-Cosmo-aarch64.sh.\n*\n**********\n\n"
