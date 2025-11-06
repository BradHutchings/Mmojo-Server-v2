#!/bin/bash

# This script patches up source code right before we compile so I don't have to maintain all the changed files in the forked repo. -Brad

# This copies the $MMOJO_SERVER_FILES tree into the $BUILD_LLAMA_CPP_DIR tree.
cp -r $MMOJO_SERVER_FILES/* $BUILD_LLAMA_CPP_DIR/

cd $BUILD_LLAMA_CPP_DIR

# Cosmo compatibility
sed -i -e 's/#if defined(_WIN32) || defined(__COSMOPOLITAN__)/#if defined(_WIN32)/g' miniaudio/miniaudio.h
if ! grep -q "#include <cstdlib>" "tools/mtmd/deprecation-warning.cpp" ; then
  sed -i '3i #include <cstdlib>' tools/mtmd/deprecation-warning.cpp
fi
if ! grep -q "#include <algorithm>" "src/llama-hparams.cpp" ; then
  sed -i '4i #include <algorithm>' src/llama-hparams.cpp
fi

# Update the CMake files.
sed -i -e 's/arg.cpp/arg-mmojo.cpp/g' common/CMakeLists.txt
sed -i -e 's/common.cpp/common-mmojo.cpp/g' common/CMakeLists.txt
sed -i -e '/log.h/a \    mmojo-args.h\n\    mmojo-args.c' common/CMakeLists.txt
sed -i -e 's/server.cpp/server-mmojo.cpp/g' tools/server/CMakeLists.txt
sed -i -e 's/set(TARGET llama-server)/set(TARGET mmojo-server)/g' tools/server/CMakeLists.txt
sed -i -e 's/loading.html/loading-mmojo.html/g' tools/server/CMakeLists.txt

# OBSOLETE: Use lbssl.a and libcrypto.a static libraries.
# We only do this tempoararily for Cosmo builds now.
# sed -i -e 's/PUBLIC OpenSSL::SSL OpenSSL::Crypto/PUBLIC libssl.a libcrypto.a/g' common/CMakeLists.txt

# Delete the rejection test for OpenSSL.
sed -i -e '/#include <openssl\/opensslv.h>/d' common/CMakeLists.txt
sed -i -e '/error bad version/d' common/CMakeLists.txt

# In tools/server/server-mmojo.cpp, replace "defer(" with "defer_task(" to make Cosmo STL happy.
sed -i -e 's/defer(/defer_task(/g' tools/server/server-mmojo.cpp

# Future: Just patch common/argc.cpp and eliminate common/argc-mmojo.cpp
# Future: Move loading-mmojo.html to loading.html instead of mangling server-mmojo.cpp. Will this work with .hpp, etc?

cd $HOME

printf "\n**********\n*\n* FINISHED: 402-Fix-llama-cpp.sh.\n*\n**********\n\n"
