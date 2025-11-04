## 201. Create Scripts Directory

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step
Let's get started by creating a `$HOME/scripts` directory and adding it to your `$PATH` environment variable.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Create `$HOME/scripts` Directory
Create `$HOME/scripts` directory.
```
SCRIPTS_DIR="$HOME/scripts"
TILDE_SCRIPTS="~/scripts"
if [ ! -d "$SCRIPTS_DIR" ]; then
  mkdir -p $SCRIPTS_DIR
fi
```

### Add `$HOME/scripts` to `$PATH`
If `$HOME/scripts` (or `~/scripts`) is not already in the `$PATH`, add `$HOME/scripts` to your `$PATH` in `.bashrc`, then `source` `.bashrc`.
```
if [[ "${PATH}" != *"${SCRIPTS_DIR}"* ]] && [[ "${PATH}" != *"${TILDE_SCRIPTS}"* ]]; then
cat << EOF >> $HOME/.bashrc
export PATH="$PATH:$SCRIPTS_DIR"
EOF
source $HOME/.bashrc
fi
echo $PATH
```

---
### Proceed
- **Next:** [202. Clone Mmojo Server Repo](202-Clone-Mmojo-Server-Repo.md)
- **Previous:** This is the first article in this section.
- **Up:** [200. Prepare Build Environment](200-Prepare-Build-Environment.md)


