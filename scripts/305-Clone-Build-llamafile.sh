#!/bin/bash

git clone https://github.com/Mozilla-Ocho/llamafile $BUILD_LLAMAFILE_DIR
cd $BUILD_LLAMAFILE_DIR
make -j8
make install PREFIX=.
cd $HOME
printf "\n**********\n*\n* FINISHED: 305-Clone-Build-llamafile.sh.\n*\n**********\n\n"
