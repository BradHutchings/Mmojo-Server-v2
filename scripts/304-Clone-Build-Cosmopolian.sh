#!/bin/bash

################################################################################
# This script clones and builds the Cosmpolitan Github repository. We use it to 
# build Actual Portable Executables (APE). Thank you to Justine Tunney and team 
# for the Cosmopolitan project!
#
# https://github.com/jart/cosmopolitan
#
# See licensing note at end.
################################################################################

if [ -d "$BUILD_COSMOPOLITAN_DIR" ]; then
    rm -r -f $BUILD_COSMOPOLITAN_DIR
fi

git clone https://github.com/jart/cosmopolitan.git $BUILD_COSMOPOLITAN_DIR
cd $BUILD_COSMOPOLITAN_DIR

# Edit the memchr_sse() function to check params.
sed -i '39i \  if ((s == NULL) || (n == 0)) return 0;' libc/intrin/memchr.c

# Build Cosmo
tool/cosmocc/package.sh

echo "#include <linux/limits.h>" > $BUILD_COSMOPOLITAN_DIR/cosmocc/include/sys/syslimits.h

# Show off what we built
printf "\nBuild of Cosmopolitan is complete.\n\n"
printf "\$ ls -al $BUILD_COSMOPOLITAN_DIR/cosmocc/bin/\n"
ls -al $BUILD_COSMOPOLITAN_DIR/cosmocc/bin/
printf "\n"

cd $HOME

printf "\n**********\n*\n* FINISHED: 304-Clone-Build-Cosmopolian.sh.\n*\n**********\n\n"

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

