## 404. Build Debug
### About this Step

In this step, we will build Mmojo Server (`mmojo-server`) for the CPU of your build environment platform without any GPU support. Even if you're more interested in APE builds or GPU-enabled builds, you can and should use this build to test and debug features of Mmojo Server that are not specific to any particular build. CPU optimizations are turned off.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Update Local Mmojo Server Repo
Have you updated your local clone of the Mmojo Server Repo today? If not, run this first:
```
mm-update-local-mmojo-server-repo.sh
. mm-environment-variables.sh
```

---
### Build Debug Mmojo Server for Build Environment Platform
This script uses cmake to build Mmojo Server:
- View the script: <a href="../scripts/404-Build-Debug.sh" target="_blank">404-Build-Debug.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/404-Build-Debug.sh
  ```

---
### OPTIONAL: Test the Build - Command-Line Arguments
Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/404-Test-Debug-Command-Line.sh" target="_blank">404-Test-Debug-Command-Line.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/404-Test-Debug-Command-Line.sh
  ```

---
### OPTIONAL: Test the Build - `mmojo-server-args` File
Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/404-Test-Debug-mmojo-server-args.sh" target="_blank">404-Test-Debug-mmojo-server-args.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/404-Test-Debug-mmojo-server-args.sh
  ```

---
### OPTIONAL: Test the Build - `mmojo-server-support` Directory
Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/404-Test-Debug-mmojo-server-support.sh" target="_blank">404-Test-Debug-mmojo-server-support.sh</a>.
- Run the script.
  ```
  $MMOJO_SERVER_SCRIPTS/404-Test-Debug-mmojo-server-support.sh
  ```

---
### Proceed
- **Next:** [405. Build APE](405-Build-APE.md)
- **Previous:** [403. Prepare to Test](403-Prepare-to-Test.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
