#!/bin/bash

################################################################################
# This script copies certifcates from the Mmojo Share.
#
# See licensing note at end.
################################################################################

if [[ ! $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
    mm-mount-mmojo-share.sh
fi

if [[ $(findmnt $MMOJO_SHARE_MOUNT_POINT) ]]; then
    if [ -d $$MMOJO_SHARE_CERTIFICATES ]; then
        cp $MMOJO_SHARE_CERTIFICATES/cert.crt $CERTIFICATES_DIR
        cp $MMOJO_SHARE_CERTIFICATES/cert.key  $CERTIFICATES_DIR
        cp $MMOJO_SHARE_CERTIFICATES/selfsignCA.crt $CERTIFICATES_DIR
    fi
fi

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
