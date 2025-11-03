#!/bin/bash

WD=$(pwd)
cd $MMOJO_SERVER_DIR
git pull
cd $WD

# Can I soft link these instead?
cp -f $MMOJO_SERVER_SCRIPTS/mm-* $HOME/scripts/
chmod a+x $HOME/scripts/mm-*

printf "\n**********\n*\n* FINISHED: mm-update-local-repo.\n*\n**********\n\n"
