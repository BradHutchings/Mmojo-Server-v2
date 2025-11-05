#!/bin/bash

if [ -d "$BUILD_COSMOPOLITAN_DIR" ]; then
    rm -r -f $BUILD_COSMOPOLITAN_DIR
fi

git clone https://github.com/jart/cosmopolitan.git $BUILD_COSMOPOLITAN_DIR
cd $BUILD_COSMOPOLITAN_DIR

# Edit the memchr_sse() function to check params.
sed -i '39i \  if ((s == NULL) || (n == 0)) return 0;' libc/intrin/memchr.c

# Build Cosmo
tool/cosmocc/package.sh

cd $HOME

printf "\n**********\n*\n* FINISHED: 304-Clone-Build-Cosmopolian.sh.\n*\n**********\n\n"
