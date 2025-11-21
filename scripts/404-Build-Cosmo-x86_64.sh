#!/bin/bash

################################################################################
# This script builds the x86_64 versions of mmojo-server, mm-zipalign, and other
# llama.cpp targets.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

cd $BUILD_DIR

# I'm working on provding an architecture level option in instructions.
# The default appears to be -march=x86-64-v2, and performance is pretty awful.
unset X86_ARCH_LEVEL
X86_ARCH_LEVEL=1
# X86_ARCH_LEVEL=2
# X86_ARCH_LEVEL=3
# X86_ARCH_LEVEL=4

unset X86_ARCH_LEVEL_PARAM
if [ -v X86_ARCH_LEVEL ]; then
    X86_ARCH_LEVEL_PARAM=" -march=x86-64-v$X86_ARCH_LEVEL "
fi

echo ""
echo "\$X86_ARCH_LEVEL: $X86_ARCH_LEVEL"
echo "\$X86_ARCH_LEVEL_PARAM: $X86_ARCH_LEVEL_PARAM"
echo ""

export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"
export CC="x86_64-unknown-cosmo-cc -I$(pwd)/cosmocc/include -L$(pwd)/cosmocc/lib \
    -DCOSMOCC=1 -nostdinc -O3 $X86_ARCH_LEVEL_PARAM"
export CXX="x86_64-unknown-cosmo-c++ -I$(pwd)/cosmocc/include \
    -DCOSMOCC=1 -nostdinc -nostdinc++ -O3 -Wno-format-truncation  $X86_ARCH_LEVEL_PARAM \
    -I$(pwd)/cosmocc/include/third_party/libcxx \
    -I$(pwd)/openssl/include \
    -L$(pwd)/cosmocc/lib -L$(pwd)/openssl"
export AR="cosmoar"

# The OpenSSL linking got moved.
cp vendor/cpp-httplib/CMakeLists.txt vendor/cpp-httplib/CMakeLists-orig.txt

# Make temporary change to CMake system so we link in static OpenSSL.
sed -i -e 's/PUBLIC OpenSSL::SSL OpenSSL::Crypto/PUBLIC libssl.a libcrypto.a/g' vendor/cpp-httplib/CMakeLists.txt
# Delete the rejection test for OpenSSL.
sed -i -e '/#include <openssl\/opensslv.h>/d' vendor/cpp-httplib/CMakeLists.txt
sed -i -e '/error bad version/d' vendor/cpp-httplib/CMakeLists.txt

# Prepare the build folder
rm -r -f $BUILD_DIR/$BUILD_COSMO_X86_64
cmake -B $BUILD_COSMO_X86_64 -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_SYSTEM_PROCESSOR=x86_64 -DCOSMOCC=1

# Revert to original CMake system.
# mv common/CMakeLists-orig.txt common/CMakeLists.txt

# The OpenSSL linking got moved.
mv vendor/cpp-httplib/CMakeLists-orig.txt vendor/cpp-httplib/CMakeLists.txt

# Build
cmake --build $BUILD_COSMO_X86_64 --config Release

# Show off what we built
printf "\nBuild of Cosmo aarch64 of llama.cpp is complete.\n\n"
printf "\$ ls -al $BUILD_DIR/$BUILD_COSMO_X86_64/bin/\n"
ls -al $BUILD_DIR/$BUILD_COSMO_X86_64/bin
printf "\n"

export PATH=$SAVE_PATH
unset CC
unset CXX
unset AR

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
