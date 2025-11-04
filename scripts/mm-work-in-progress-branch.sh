#!/bin/bash

# THe $SCRIPTS_DIR was created and added to $PATH in step 201.
SCRIPTS_DIR="$HOME/scripts/"

if [ -d "$MMOJO_SERVER_DIR" ]; then
  cd $MMOJO_SERVER_DIR
  git checkout work-in-progress
  cd $HOME

  ### Links don't work - end up modifying repo files on chmod.
  # for FILE in $MMOJO_SERVER_SCRIPTS/mm-*.sh; do
  #  ln -sf $FILE $SCRIPTS_DIR
  # done
  cp $MMOJO_SERVER_SCRIPTS/mm-*.sh $SCRIPTS_DIR
  chmod a+x $SCRIPTS_DIR/mm-*.sh
else
  echo "The $MMOJO_SERVER_DIR directory does not exist."
fi
printf "\n**********\n*\n* FINISHED: mm-work-in-progress-branch.\n*\n**********\n\n"
