## 1403. Build Debug
### About this Step
**This is an experimental section for a differently branded version without the UI customizations. It probably does not work.**

In this step, we will build Dogpile (`dogpile`) for the CPU of your build environment platform without any GPU support. Even if you're more interested in APE builds, you can and should use this build to test and debug features of Dogpile that are not specific to any particular build. CPU optimizations are turned off.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
<details>
  <summary><b>Update Local Mmojo Server Repo</b> &mdash; Expand if you haven't today.</summary>
  
Have you updated your local clone of the Mmojo Server Repo today? If not, run this first:
```
mm-update-local-mmojo-server-repo.sh
. mm-environment-variables.sh
```
</details>

---
### Build Debug Dogpile for Build Environment Platform
This script uses cmake to build Mmojo Server:
- View the script: <a href="../../scripts/1403-Build-Debug.sh" target="_blank">1403-Build-Debug.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/1403-Build-Debug.sh
  ```

---
### Test the Build - Command-Line Arguments
Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../../scripts/1403-Test-Debug-Command-Line.sh" target="_blank">1403-Test-Debug-Command-Line.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/403-Test-Debug-Command-Line.sh
  ```

---
### SHORTCUT: Build Debug, Test
I really think you should run through these scripts one at a time the first few times you build, so you can familiarize yourself with the process and know what goes where. But, now that you've run through a few times, you can use the shortcut snippet to build and test a debug build:
```
################################################################################
# SHORTCUT: DON'T DO THIS IF YOU ALREADY RAN SCRIPTS ABOVE!
################################################################################
$MMOJO_SERVER_SCRIPTS/1403-Build-Debug.sh
$MMOJO_SERVER_SCRIPTS/1403-Test-Debug-Command-Line.sh
```

---
### Proceed
- **Next:** [1404. Build APE](1404-Build-APE.md)
- **Previous:** [1402. Prepare to Test](1402-Prepare-to-Test.md)
- **Up:** [1400. Build Dogpile](1400-Build-Dogpile.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
