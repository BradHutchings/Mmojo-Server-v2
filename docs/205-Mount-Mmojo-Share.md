## 205. Mount Mmojo Share

**THIS NEEDS TO BE REWRITTEN WITH 204-mount-mmojo-share.sh COPIED TO $HOME/scripts/mm-mount-mmojo-share.sh. IT CAN'T BE LINKED BECAUSE USER WILL EDIT. -Brad 2025-11-04**

---
### About the Step
The Mmojo Share is a file share where I keep files for local access and completed builds. It lets me build different items on different build platforms. I use a Ubuntu 24.04 virtual machine to build and test x86_64 and cosmo builds. I use a Raspberry Pi for building and testing ARM64 and Pi specific builds. The Mmojo Share lets me keep .gguf models to test with locally and is where I copy completed and packaged builds. Your Mmojo Share will help you organize your builds as well.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Mount Mmojo Share

1. We need some variables:
   ```
   SHARE_DIR="/mnt/mmojo"
   SCRIPTS_DIR="$HOME/scripts"
   MOUNT_SCRIPT="mm-mount-mmojo-share.sh"
   ```
2. Create `/mnt/mmojo` directory.
   ```
   if [ ! -d "$SHARE_DIR" ]; then
       sudo mkdir -p $SHARE_DIR
   fi
   ```
3. Create an `mm-mount-mmojo-share.sh` script.
   ```
   cat << EOF > "$SCRIPTS_DIR/$MOUNT_SCRIPT"
   if [[ ! \$(findmnt $SHARE_DIR) ]]; then
       sudo mount -t cifs -o user=[USER] //[COMPUTER]/mmojo $SHARE_DIR
   fi
   EOF
   chmod a+x "$SCRIPTS_DIR/$MOUNT_SCRIPT"
   ```
4. Edit the script to put your `COMPUTER` and `USER` names in. "Ctrl-X" then "Y" to exit and save.
   ```
   nano "$SCRIPTS_DIR/$MOUNT_SCRIPT"
   ```
5. Mount the Mmojo share and list its contents.
   ```
   mm-mount-mmojo-share.sh
   ls -al /mnt/mmojo
   ```

---
### Proceed
- **Next:** [206. Install Dependencies](206-Install-Dependencies.md)
- **Previous:** [204. Create Mmojo Share](204-Create-Mmojo-Share.md)
- **Up:** [200. Prepare Build Environment](200-Prepare-Build-Environment.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
