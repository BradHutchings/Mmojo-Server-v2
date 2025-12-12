printf "\n**********\n*\n* START: mm-clone-mmojo-server-repo.sh.\n*\n**********\n\n"
export MMOJO_SERVER_DIR="$HOME/200-mmojo-server"
export MMOJO_SERVER_SCRIPTS="$MMOJO_SERVER_DIR/scripts"
cd $HOME
if [ "$MMOJO_SERVER_DIR" ]; then
  rm -r -f $MMOJO_SERVER_DIR
fi
mkdir -p $MMOJO_SERVER_DIR
git clone https://github.com/BradHutchings/mmojo-server.git $MMOJO_SERVER_DIR

# mm-update-local-mmojo-server-repo.sh uses these variables, so set them first.
. $MMOJO_SERVER_SCRIPTS/mm-environment-variables.sh

# mm-update-local-mmojo-server-repo.sh copies mm- scripts to $HOME/mm-scripts
. $MMOJO_SERVER_SCRIPTS/mm-update-local-mmojo-server-repo.sh

if ! grep -q "mm-env=" "$HOME/.bashrc"; then
cat << EOF1 >> $HOME/.bashrc
alias mm-env=". mm-environment-variables.sh"
mm-env
EOF1
source $HOME/.bashrc
fi

printf "\n**********\n*\n* FINISHED: mm-clone-mmojo-server-repo.sh.\n*\n**********\n\n"
