#!/bin/bash

$SCRIPTS_DIR="$HOME/scripts/"
if [ ! -d "$SCRIPTS_DIR" ]; then
  mkdir -p $SCRIPTS_DIR
fi

if [ -d "$MMOJO_SERVER_DIR" ]; then
  cd $MMOJO_SERVER_DIR
  git checkout main
  cd $HOME

  for FILE in $MMOJO_SERVER_SCRIPTS/mm-*.sh; do
    ln -sf $FILE $SCRIPTS_DIR
  done
  chmod a+x $SCRIPTS_DIR/mm-*.sh
else
  echo "The $MMOJO_SERVER_DIR directory does not exist."
fi
printf "\n**********\n*\n* FINISHED: mm-main-branch.\n*\n**********\n\n"
