## 202. Create Scripts and Tools Directories
### About this Step
Let's get started by creating a `$HOME/scripts` directory and a `$HOME\tools` directory, then adding them to your `$PATH` environment variable.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Create `$HOME/scripts` and `$HOME/tools` Directories, Add to `$PATH`
Create `$HOME/scripts` and `$HOME/tools` directories, then add them to your `$PATH` in `.bashrc`.
```
HOME_SCRIPTS="$HOME/scripts"
TILDE_SCRIPTS="~/scripts"
HOME_TOOLS="$HOME/tools"
TILDE_TOOLS="~/tools"
mkdir -p $HOME_SCRIPTS
mkdir -p $HOME_TOOLS

if [[ "${PATH}" != *"${HOME_SCRIPTS}"* ]] && [[ "${PATH}" != *"${TILDE_SCRIPTS}"* ]]; then
cat << EOF >> $HOME/.bashrc
export PATH="$PATH:$HOME_SCRIPTS"
EOF
fi

if [[ "${PATH}" != *"${HOME_TOOLS}"* ]] && [[ "${PATH}" != *"${TILDE_TOOLS}"* ]]; then
cat << EOF >> $HOME/.bashrc
export PATH="$PATH:$HOME_TOOLS"
EOF
fi

source $HOME/.bashrc
echo $PATH
```

---
### Proceed
- **Next:** [203. Clone Mmojo Server Repo](203-Clone-Mmojo-Server-Repo.md)
- **Previous:** [201. Prepare WSL](201-Prepare-WSL.md)
- **Up:** [200. Prepare Build Environment](200-Prepare-Build-Environment.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)

