#!/bin/bash

################################################################################
# This script builds the x86_64 versions of mmojo-server, mm-zipalign, and other
# llama.cpp targets.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

cd $DOGPILE_BUILD_DIR

unset X86_64_ARCH_LEVEL_PARAM
X86_64_ARCH_LEVEL_PARAM=" -march=x86-64 "
if [ -v CPU_PERFORMANCE_LEVEL ]; then
  case $CPU_PERFORMANCE_LEVEL in
    1)
        X86_64_ARCH_LEVEL_PARAM=" -march=x86-64 "
        ;;
    2)
        X86_64_ARCH_LEVEL_PARAM=" -march=x86-64-v2 "
        ;;
    3)
        X86_64_ARCH_LEVEL_PARAM=" -march=x86-64-v3 "
        ;;
    4)
        X86_64_ARCH_LEVEL_PARAM=" -march=x86-64-v4 "
        ;;
    *)
        X86_64_ARCH_LEVEL_PARAM=" -march=x86-64 "
        ;;
  esac
fi

echo ""
echo "\$CPU_PERFORMANCE_LEVEL: $CPU_PERFORMANCE_LEVEL"
echo "\$X86_64_ARCH_LEVEL_PARAM: $X86_64_ARCH_LEVEL_PARAM"
echo ""

export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"

# Recent discovery -- cosmo-cc and cosmo-c++ can figure out the -I and -L related to cosmo.
# No need to specify them here.
export CC="x86_64-unknown-cosmo-cc \
    -DCOSMOCC=1 -nostdinc -O3 $X86_64_ARCH_LEVEL_PARAM"
export CXX="x86_64-unknown-cosmo-c++ \
    -DCOSMOCC=1 -nostdinc -nostdinc++ -O3 -Wno-format-truncation $X86_64_ARCH_LEVEL_PARAM  \
    -I$(pwd)/openssl/include \
    -L$(pwd)/openssl"
export AR="cosmoar"

# The OpenSSL linking got moved.
cp vendor/cpp-httplib/CMakeLists.txt vendor/cpp-httplib/CMakeLists-orig.txt

# Make temporary change to CMake system so we link in static OpenSSL.
sed -i -e 's/PUBLIC OpenSSL::SSL OpenSSL::Crypto/PUBLIC libssl.a libcrypto.a/g' vendor/cpp-httplib/CMakeLists.txt
# Delete the rejection test for OpenSSL.
sed -i -e '/#include <openssl\/opensslv.h>/d' vendor/cpp-httplib/CMakeLists.txt
sed -i -e '/error bad version/d' vendor/cpp-httplib/CMakeLists.txt

# Prepare the build folder
rm -r -f $DOGPILE_BUILD_DIR/$BUILD_COSMO_X86_64
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
printf "\$ ls -al $DOGPILE_BUILD_DIR/$BUILD_COSMO_X86_64/bin/\n"
ls -al $DOGPILE_BUILD_DIR/$BUILD_COSMO_X86_64/bin
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
