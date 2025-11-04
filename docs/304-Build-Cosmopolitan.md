## 304. Build Cosmopolitan

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step - DO THIS ONCE
In this step, we will clone the Cosmopolitan repo, fix known problems, and build it. You don't need to do this every time you build Mmojo Server.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

<!--
---
### Environment Variables
This script sets environment variables:
- View script: <a href="../scripts/mm-environment-variables.sh" target="_blank">mm-environment-variables.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script, which is linked into your `$HOME/scripts` directory. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  ```

_Note that if you copy each code block from the guide and paste it into your terminal, each block ends with a message so you won't lose your place in this guide._
-->

---
### Clone Cosmopolitan Repo, Build Locally
Clone Cosmopolitan repo into a `$BUILD_COSMOPOLITAN_DIR` directory, fix bugs, then build Cosmopolitan. Build this once, and leave the `$BUILD_COSMOPOLITAN_DIR` directory between builds.

This script clone the Cosmopolitan repo to `$BUILD_COSMOPOLITAN_DIR`:
- View script: <a href="../scripts/304-Clone-Build-Cosmopolian.sh" target="_blank">304-Clone-Build-Cosmopolian.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  . $MMOJO_SERVER_SCRIPTS/304-Clone-Build-Cosmopolian.sh
  ```

---
### Proceed
- **Next:** [305. Build llamafile](305-Build-llamafile.md)
- **Previous:** [303. Copy Models](303-Copy-Models.md)
- **Up:** [300. Gather Build Pieces](300-Gather-Build-Pieces.md)
