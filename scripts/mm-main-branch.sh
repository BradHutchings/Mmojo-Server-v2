#!/bin/bash

if [ -d "$MMOJO_SERVER_DIR" ]; then
  cd $MMOJO_SERVER_DIR
  git checkout main
  cd $HOME

  # Can I soft link these instead?
  cp -f $MMOJO_SERVER_SCRIPTS/mm-* $HOME/scripts/
  chmod a+x $HOME/scripts/mm-*
else
  echo "The $MMOJO_SERVER_DIR directory does not exist."
fi
printf "\n**********\n*\n* FINISHED: mm-main-branch.\n*\n**********\n\n"
