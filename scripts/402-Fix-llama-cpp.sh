#!/bin/bash

# This copies the $MMOJO_SERVER_FILES tree into the $BUILD_LLAMA_CPP_DIR tree.
cp -r $MMOJO_SERVER_FILES/* $BUILD_LLAMA_CPP_DIR/

printf "\n**********\n*\n* FINISHED: 402-Fix-llama-cpp.sh.\n*\n**********\n\n"
