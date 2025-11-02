#!/bin/bash

#----------------------------------------
# We need some variables:
#----------------------------------------
export SHARE_DIR="/mnt/mmojo"
export SCRIPTS_DIR="$HOME/scripts"
TILDE_SCRIPTS="~/scripts"
export MOUNT_SCRIPT="mount-mmojo-share.sh"

#----------------------------------------
# Create `/mnt/mmojo` directory.
#----------------------------------------
if [ ! -d "$SHARE_DIR" ]; then
    sudo mkdir -p $SHARE_DIR
fi

#----------------------------------------
# Create `$HOME/scripts` directory.
#----------------------------------------
if [ ! -d "$SCRIPTS_DIR" ]; then
    mkdir -p $SCRIPTS_DIR
fi

#----------------------------------------
# Create a `mount-mmojo-share.sh` script.
#----------------------------------------
cat << EOF > "$SCRIPTS_DIR/$MOUNT_SCRIPT"
if [[ ! \$(findmnt $SHARE_DIR) ]]; then
    sudo mount -t cifs -o user=[USER] //[COMPUTER]/mmojo $SHARE_DIR
fi
EOF
chmod a+x "$SCRIPTS_DIR/$MOUNT_SCRIPT"

#------------------------------------------------------------------------------------------------------------------------
# If `~/scripts` is not already in the `$PATH`, add `~/scripts` to your `$PATH` in `.bashrc` and `source` `.bashrc`.
#------------------------------------------------------------------------------------------------------------------------
if [[ "${PATH}" != *"${SCRIPTS_DIR}"* ]] && [[ "${PATH}" != *"${TILDE_SCRIPTS}"* ]]; then
cat << EOF >> $HOME/.bashrc
export PATH="$PATH:$SCRIPTS_DIR"
EOF
source $HOME/.bashrc
echo "Your \$PATH has been set to:\n$PATH"
fi
