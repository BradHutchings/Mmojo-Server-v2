## 206. Install Dependencies
### About this Step
Install system package updates, then install packages we will need for our build system.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Install Package Updates
This script installs available package updates for your Linux system:
- View script: <a href="../scripts/206-Install-Package-Updates.sh" target="_blank">206-Install-Package-Updates.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/206-Install-Package-Updates.sh
  ```

---
### Install Dependencies
This script installs dependencies you will need:
- View script: <a href="../scripts/206-Install-Dependencies.sh" target="_blank">206-Install-Dependencies.sh</a>.
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . $MMOJO_SERVER_SCRIPTS/206-Install-Dependencies.sh
  ```

---
### Proceed
- **Next:** This is the last article in this section.
- **Previous:** [205. Mount Mmojo Share](205-Mount-Mmojo-Share.md)
- **Up:** [200. Prepare Build Environment](200-Prepare-Build-Environment.md)

<!--
- **Next:** [207. Set up Cross Compile - aarch64 on x86_64](207-Set-up-Cross-Compile-aarch64-on-x86_64.md)
-->

---
### Next Section
- **Next Section:** [300. Gather Build Pieces](300-Gather-Build-Pieces.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
