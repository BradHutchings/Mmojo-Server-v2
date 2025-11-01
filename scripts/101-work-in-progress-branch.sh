#!/bin/bash

if [ -d "$MMOJO_SERVER_DIR" ]; then
  cd $MMOJO_SERVER_DIR
  git checkout work-in-progress
  cd $HOME
else
  echo "The $MMOJO_SERVER_DIR directory does not exist."
fi
printf "\n**********\n*\n* FINISHED: Checkout work-in-progress.\n*\n**********\n\n"
