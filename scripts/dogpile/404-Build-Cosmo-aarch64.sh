#!/bin/bash

################################################################################
# This script builds the aarch64 (arm64) versions of dogpile, mm-zipalign,
# and other llama.cpp targets.
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

cd $DOGPILE_BUILD_DIR

unset AARCH64_ARCH_LEVEL_PARAM
if [ -v CPU_PERFORMANCE_LEVEL ]; then
  case $CPU_PERFORMANCE_LEVEL in
    1)
        unset AARCH64_ARCH_LEVEL_PARAM
        ;;
    2)
        AARCH64_ARCH_LEVEL_PARAM=" -march=armv8-a " 
        ;;
    3)
        AARCH64_ARCH_LEVEL_PARAM=" -march=armv8-a "
        ;;
    4)
        AARCH64_ARCH_LEVEL_PARAM=" -march=armv8-a "
        ;;
    *)
        AARCH64_ARCH_LEVEL_PARAM=" -march=armv8.4-a "
        ;;
  esac
fi

echo ""
echo "\$CPU_PERFORMANCE_LEVEL: $CPU_PERFORMANCE_LEVEL"
echo "\$AARCH64_ARCH_LEVEL_PARAM: $AARCH64_ARCH_LEVEL_PARAM"
echo ""

export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"

# Recent discovery -- cosmo-cc and cosmo-c++ can figure out the -I and -L related to cosmo.
# No need to specify them here.
export CC="aarch64-unknown-cosmo-cc  \
    -DCOSMOCC=1 -nostdinc -O3 $AARCH64_ARCH_LEVEL_PARAM"
export CXX="aarch64-unknown-cosmo-c++ \
    -DCOSMOCC=1 -nostdinc -nostdinc++ -O3 -Wno-format-truncation $AARCH64_ARCH_LEVEL_PARAM \
    -I$(pwd)/openssl/include \
    -L$(pwd)/openssl/.aarch64/"
export AR="cosmoar"

# Make temporary change to CMake system so we link in static OpenSSL.
cp common/CMakeLists.txt common/CMakeLists-orig.txt
sed -i -e 's/PUBLIC OpenSSL::SSL OpenSSL::Crypto/PUBLIC libssl.a libcrypto.a/g' common/CMakeLists.txt

# Prepare the build folder
rm -r -f $DOGPILE_BUILD_DIR/$BUILD_COSMO_AARCH64
cmake -B $BUILD_COSMO_AARCH64 -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_SYSTEM_PROCESSOR=aarch64 -DCOSMOCC=1

# Revert to original CMake system.
mv common/CMakeLists-orig.txt common/CMakeLists.txt

# Build
cmake --build $BUILD_COSMO_AARCH64 --config Release

# Show off what we built
printf "\nBuild of Cosmo aarch64 of llama.cpp is complete.\n\n"
printf "\$ ls -al $DOGPILE_BUILD_DIR/$BUILD_COSMO_AARCH64/bin/\n"
ls -al $DOGPILE_BUILD_DIR/$BUILD_COSMO_AARCH64/bin
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
