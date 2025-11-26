#!/bin/bash

################################################################################
# This script patches up source code right before we compile so I don't have to 
# maintain all the changed files within this repo's /files directory. -Brad
#
# See licensing note at end.
################################################################################

SCRIPT_NAME=$(basename -- "$0")
printf "\n$STARS\n*\n* STARTED: $SCRIPT_NAME.\n*\n$STARS\n\n"

# This copies the $MMOJO_SERVER_FILES tree into the $BUILD_DIR tree.
cp -r $MMOJO_SERVER_FILES/* $DOGPILE_BUILD_DIR/

cd $DOGPILE_BUILD_DIR

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
sed -i -e 's/add_subdirectory(server)/add_subdirectory(server)\n\tif (COSMOCC)\n\t\tadd_subdirectory(zipalign)\n\tendif()/g' tools/CMakeLists.txt
sed -i -e 's/server.cpp/server-mmojo.cpp/g' tools/server/CMakeLists.txt
sed -i -e 's/server-hhtp.cpp/server-http-mmojo.cpp/g' tools/server/CMakeLists.txt
sed -i -e 's/set(TARGET llama-server)/set(TARGET dogpile)/g' tools/server/CMakeLists.txt

# What to do about this?!?
sed -i -e 's/loading.html/loading-mmojo.html/g' tools/server/CMakeLists.txt

# In tools/server/server-mmojo.cpp, customize for Dogpile
sed -i -e 's/PROCESS_NAME\ \"mmojo-server\"/PROCESS_NAME\ \"dogpile\"/g' tools/server/server-mmojo.cpp
sed -i -e 's/ARGS_FILENAME\ \"mmojo-server-args\"/ARGS_FILENAME\ \"dogpile-args\"/g' tools/server/server-mmojo.cpp
sed -i -e 's/SUPPORT_DIRECTORY_NAME\ \"mmojo-server-support\"/SUPPORT_DIRECTORY_NAME\ \"dogpile-support\"/g' tools/server/server-mmojo.cpp

# In tools/server/server-mmojo.cpp, replace "defer(" with "defer_task(" to make Cosmo STL happy.
sed -i -e 's/defer(/defer_task(/g' tools/server/server-mmojo.cpp
sed -i -e 's/server_queue::defer(/server_queue::defer_task(/g' tools/server/server-queue.cpp
sed -i -e 's/void\ defer(/void\ defer_task(/g' tools/server/server-queue.h

# Future: Just patch common/argc.cpp and eliminate common/argc-mmojo.cpp
# Future: Move loading-mmojo.html to loading.html instead of mangling server-mmojo.cpp. Will this work with .hpp, etc?

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
