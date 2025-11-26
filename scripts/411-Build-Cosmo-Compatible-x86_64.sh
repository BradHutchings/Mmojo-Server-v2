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

# I'm working on providing an architecture level option in instructions.
# The default appears to be -march=x86-64 (v1), and performance is pretty awful.

# This should be a generic CPU_PERFORMANCE_LEVEL and map to X86_64 and AARCH64.
# We could have a very compatible build, and a performance build, and use CPU
# build as specialized. I don't think you could really run an LLM on a CPU
# stuck at -march=x86-64-v2.

# Tool for determining x86_64 level: https://github.com/HenrikBengtsson/x86-64-level

# CPU_PERFORMANCE_LEVEL
# - 1: Widely compatible.        X86_ARCH_LEVEL=1, AARCH64= unset AARCH64_ARCH_LEVEL_PARAM <-- Widely compatible
# - 2: Performant-1.             X86_ARCH_LEVEL=2, AARCH64=armv8-a (R-Pi 3+)
# - 2: Performant-2.             X86_ARCH_LEVEL=3, AARCH64=armv8-a (R-Pi 3+) <-- Good default.
# - 2: Performant-3.             X86_ARCH_LEVEL=4, AARCH64=armv8.4-a (Apple M*)

# Pi should have a CPU native version.
# Apple M* should have a METAL version -- use M1 arch for CPU.

# AARCH64 -march values:
# - R-Pi 3+     -march=armv8-a      https://en.wikipedia.org/wiki/Raspberry_Pi#Specifications 
# - Apple M1    -march=armv8.4-a    https://en.wikipedia.org/wiki/Apple_M1
# - Apple M2    -march=armv8.6-a    https://en.wikipedia.org/wiki/Apple_M2
# - Apple M3    -march=armv8.6-a    https://en.wikipedia.org/wiki/Apple_M3
# - Apple M4    -march=armv9.2-a    https://en.wikipedia.org/wiki/Apple_M4

X86_64_ARCH_LEVEL_PARAM=" -march=x86-64 "

export PATH="$(pwd)/cosmocc/bin:$SAVE_PATH"

# Recent discovery -- cosmo-cc and cosmo-c++ can figure out the -I and -L related to cosmo.
# No need to specify them here.
export CC="x86_64-unknown-cosmo-cc \
    -nostdinc -O3 $X86_64_ARCH_LEVEL_PARAM"
export CXX="x86_64-unknown-cosmo-c++ \
    -nostdinc -nostdinc++ -O3 -Wno-format-truncation $X86_64_ARCH_LEVEL_PARAM  \
    -I$(pwd)/openssl/include \
    -L$(pwd)/openssl"
export AR="cosmoar"

# -DCOSMOCC=1 

# The OpenSSL linking got moved to vendor/cpp-httplib/CMakeLists.txt.
cp vendor/cpp-httplib/CMakeLists.txt vendor/cpp-httplib/CMakeLists-orig.txt

# Make temporary change to CMake system so we link in static OpenSSL.
sed -i -e 's/PUBLIC OpenSSL::SSL OpenSSL::Crypto/PUBLIC libssl.a libcrypto.a/g' vendor/cpp-httplib/CMakeLists.txt
# Delete the rejection test for OpenSSL.
sed -i -e '/#include <openssl\/opensslv.h>/d' vendor/cpp-httplib/CMakeLists.txt
sed -i -e '/error bad version/d' vendor/cpp-httplib/CMakeLists.txt

# Prepare the build folder
rm -r -f $BUILD_DIR/$BUILD_COSMO_COMPATIBLE_X86_64
cmake -B $BUILD_COSMO_COMPATIBLE_X86_64 -DBUILD_SHARED_LIBS=OFF -DLLAMA_CURL=OFF -DLLAMA_OPENSSL=ON \
    -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_SYSTEM_PROCESSOR=x86_64 -DCOSMOCC=1

# Revert to original CMake system.
# The OpenSSL linking got moved to vendor/cpp-httplib/CMakeLists.txt.
mv vendor/cpp-httplib/CMakeLists-orig.txt vendor/cpp-httplib/CMakeLists.txt

# Build
cmake --build $BUILD_COSMO_COMPATIBLE_X86_64 --config Release

# Show off what we built
printf "\nBuild of Cosmo aarch64 of llama.cpp is complete.\n\n"
printf "\$ ls -al $BUILD_DIR/$BUILD_COSMO_COMPATIBLE_X86_64/bin/\n"
ls -al $BUILD_DIR/$BUILD_COSMO_COMPATIBLE_X86_64/bin
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
