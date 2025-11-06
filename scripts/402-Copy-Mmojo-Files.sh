#!/bin/bash

# Will this work?
cp -r -f $MMOJO_SERVER_FILES/* $BUILD_LLAMA_CPP_DIR/common

# How about these?
cp -r -f $MMOJO_SERVER_FILES/common/* $BUILD_LLAMA_CPP_DIR/common
cp -r -f $MMOJO_SERVER_FILES/tools/server/* $BUILD_LLAMA_CPP_DIR/tools/server

printf "\n**********\n*\n* FINISHED: 402-Copy-Mmojo-Files.sh.\n*\n**********\n\n"
