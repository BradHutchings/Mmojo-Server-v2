#!/bin/bash

if [ -d "$MMOJO_SERVER_DIR" ]; then
  cd $MMOJO_SERVER_DIR
  git checkout work-in-progress
  cd $HOME

  for FILE in $MMOJO_SERVER_SCRIPTS/mm-*.sh; do
    ln -sf $FILE $HOME/scripts
  done
  chmod a+x $HOME/scripts/mm-*.sh
else
  echo "The $MMOJO_SERVER_DIR directory does not exist."
fi
printf "\n**********\n*\n* FINISHED: mm-work-in-progress-branch.\n*\n**********\n\n"
