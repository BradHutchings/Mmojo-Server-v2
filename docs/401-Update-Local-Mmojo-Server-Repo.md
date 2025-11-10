## 401. Update Local Mmojo Server Repo
### About this Step
Before building Mmojo Server, let's make sure our local copy of the Mmojo Server repo is up to date with the latest instructions and scripts.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Update Local Mmojo Server Repo
We already have a script in place in `$HOME/scripts` to update the repo and copy any updated `mm-` scripts:
```
. mm-environment-variables.sh
mm-update-local-mmojo-server-repo.sh
. mm-environment-variables.sh
```

---
### Proceed
- **Next:** [402. Prepare to Build](402-Prepare-to-Build.md)
- **Previous:** This is the first article in this section.
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
