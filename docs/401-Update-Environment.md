## 401. Update Environment
### About this Step
Before building Mmojo Server, let's make sure our local copy of the Mmojo Server repo is up to date with the latest instructions and scripts. Let's also set whether you want a chat interface when you test.

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
### Optional: Use `work-in-progress` Branch of Mmojo Server Repo
Use the `work-in-progress` branch where I implement and test my own changes and where I test changes from `llama.cpp`.
```
mm-work-in-progress-branch.sh
. mm-environment-variables.sh
```

### Optional: Set Chat User Interface
If you prefer using the llama.cpp chat user interface instead of Mmojo Complete for testing, run this command:
```
export TEST_WITH_CHAT_UI=1
```

---
### Proceed
- **Next:** [402. Prepare to Build](402-Prepare-to-Build.md)
- **Previous:** This is the first step in this section.
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
