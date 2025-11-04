#!/bin/bash

SCRIPTS_DIR="$HOME/scripts/"
if [ ! -d "$SCRIPTS_DIR" ]; then
  mkdir -p $SCRIPTS_DIR
fi

WD=$(pwd)
cd $MMOJO_SERVER_DIR
git pull
cd $WD

### Links don't work - end up modifying repo files on chmod.
# for FILE in $MMOJO_SERVER_SCRIPTS/mm-*.sh; do
#  ln -sf $FILE $SCRIPTS_DIR
# done
cp $MMOJO_SERVER_SCRIPTS/mm-*.sh $SCRIPTS_DIR
chmod a+x $SCRIPTS_DIR/mm-*.sh

printf "\n**********\n*\n* FINISHED: mm-update-local-repo.\n*\n**********\n\n"
