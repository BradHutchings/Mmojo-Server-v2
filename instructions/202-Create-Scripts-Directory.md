## 202. Create Scripts Directory
### About this Step
Let's get started by creating a `$HOME/scripts` directory and a `$HOME/tools` directory, then adding them to your `$PATH` environment variable.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Create `$HOME/scripts` Directory Add to `$PATH`
Create `$HOME/scripts` and `$HOME/tools` directories, then add them to your `$PATH` in `.bashrc`.
```
HOME_SCRIPTS="$HOME/mmscripts"
TILDE_SCRIPTS="~/mmscripts"
mkdir -p $HOME_SCRIPTS

if [[ "${PATH}" != *"${HOME_SCRIPTS}"* ]] && [[ "${PATH}" != *"${TILDE_SCRIPTS}"* ]]; then
cat << EOF >> $HOME/.bashrc
export PATH="\$PATH:$HOME_SCRIPTS"
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

