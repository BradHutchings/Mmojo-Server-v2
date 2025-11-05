#!/bin/bash

if [ -d "$BUILD_LLAMAFILE_DIR" ]; then
    rm -r -f $BUILD_LLAMAFILE_DIR
fi

git clone https://github.com/Mozilla-Ocho/llamafile $BUILD_LLAMAFILE_DIR
# Roll back to: https://github.com/mozilla-ai/llamafile/commit/ff0c02e6c560d88324966e88a718485989b41c1e
cd $BUILD_LLAMAFILE_DIR
git checkout ff0c02e6c560d88324966e88a718485989b41c1e

# Build llamafile
make -j8
make install PREFIX=.

cd $HOME

printf "\n**********\n*\n* FINISHED: 305-Clone-Build-llamafile.sh.\n*\n**********\n\n"
