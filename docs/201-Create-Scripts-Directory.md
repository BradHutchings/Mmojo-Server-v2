## 201. Create Scripts Directory

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step
Let's get started by create a `$HOME/scripts` directory and adding it to your `$PATH`.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### That Step Here

Do something:
```
# The script goes here.

export MMOJO_SERVER_DIR="$HOME/201-mmojo-server"
export MMOJO_SERVER_SCRIPTS="$MMOJO_SERVER_DIR/scripts"
cd $HOME
if [ ! -d "$MMOJO_SERVER_DIR" ]; then
  mkdir -p $MMOJO_SERVER_DIR
  git clone https://github.com/BradHutchings/mmojo-server-v2.git $MMOJO_SERVER_DIR
  . $MMOJO_SERVER_SCRIPTS/mm-update-local-repo.sh
fi
printf "\n**********\n*\n* FINISHED: Clone the Mmojo Server Repo.\n*\n**********\n\n"
```


---
### Proceed
- **Next:** [202. Clone Mmojo Server Repo](202-Clone-Mmojo-Server-Repo.md)
- **Previous:** This is the first article in this section.
- **Up:** [200. Prepare Build Environment](200-Prepare-Build-Environment.md)


