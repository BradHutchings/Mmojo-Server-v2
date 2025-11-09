## 301. Update Local Mmojo Server Repo
### About this Step
Before gathering build pieces, let's make sure our local copy of the Mmojo Server repo is up to date with the latest instructions and scripts. 

*Side note: I use this command all the time while working on docs and scripts in this repo on Github. -Brad*

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Update Local Mmojo Server Repo
We have a script in `$HOME/scripts` to update the repo and copy any updated `mm-` scripts:
```
. mm-environment-variables.sh
mm-update-local-repo.sh
. mm-environment-variables.sh
```

---
### Proceed
- **Next:** [302. Download Models](302-Download-Models.md)
- **Previous:** This is the first article in this section.
- **Up:** [300. Gather Build Pieces](300-Gather-Build-Pieces.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
