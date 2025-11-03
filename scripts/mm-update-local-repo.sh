#!/bin/bash

WD=$(pwd)
cd $MMOJO_SERVER_DIR
git pull
cd $WD

for FILE in $MMOJO_SERVER_SCRIPTS/mm-*.sh; do
  ln -sf $FILE $HOME/scripts
done
chmod a+x $HOME/scripts/mm-*.sh

printf "\n**********\n*\n* FINISHED: mm-update-local-repo.\n*\n**********\n\n"
