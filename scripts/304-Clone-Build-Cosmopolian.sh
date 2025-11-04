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

printf "\n**********\n*\n* FINISHED: Clone Cosmopolitan Repo, Build Locally.\n*\n**********\n\n"
