## 201. Create Scripts and Tools Directories
### About this Step
Let's get started by creating a `$HOME/scripts` directory and a `$HOME\tools` directory, then adding them to your `$PATH` environment variable.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Create `$HOME/scripts` and `$HOME/tools` Directories
Create `$HOME/scripts` and `$HOME/tools` directories.
```
HOME_SCRIPTS="$HOME/scripts"
TILDE_SCRIPTS="~/scripts"
HOME_TOOLS="$HOME/tools"
TILDE_TOOLS="~/tools"
mkdir -p $HOME_SCRIPTS
mkdir -p $HOME_TOOLS
```

### Add `$HOME/scripts` to `$PATH`
If `$HOME/scripts` (or `~/scripts`) is not already in the `$PATH`, add `$HOME/scripts` to your `$PATH` in `.bashrc`, then `source` `.bashrc`.
```
if [[ "${PATH}" != *"${HOME_SCRIPTS}"* ]] && [[ "${PATH}" != *"${TILDE_SCRIPTS}"* ]]; then
cat << EOF >> $HOME/.bashrc
export PATH="$PATH:$HOME_SCRIPTS"
EOF
source $HOME/.bashrc
fi
echo $PATH
```

### Add `$HOME/tools` to `$PATH`
If `$HOME/tools` (or `~/tools`) is not already in the `$PATH`, add `$HOME/tools` to your `$PATH` in `.bashrc`, then `source` `.bashrc`.
```
if [[ "${PATH}" != *"${HOME_TOOLS}"* ]] && [[ "${PATH}" != *"${TILDE_TOOLS}"* ]]; then
cat << EOF >> $HOME/.bashrc
export PATH="$PATH:$HOME_TOOLS"
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

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)

