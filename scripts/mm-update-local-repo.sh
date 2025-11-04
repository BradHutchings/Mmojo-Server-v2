#!/bin/bash

SCRIPTS_DIR="$HOME/scripts/"
if [ ! -d "$SCRIPTS_DIR" ]; then
  mkdir -p $SCRIPTS_DIR
fi

WD=$(pwd)
cd $MMOJO_SERVER_DIR
git pull
cd $WD

for FILE in $MMOJO_SERVER_SCRIPTS/mm-*.sh; do
  ln -sf $FILE $SCRIPTS_DIR
done
chmod a+x $SCRIPTS_DIR/mm-*.sh

printf "\n**********\n*\n* FINISHED: mm-update-local-repo.\n*\n**********\n\n"
