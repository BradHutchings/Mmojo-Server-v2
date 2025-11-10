## 405. Build APE
### About this Step
In this step, we will build Mmojo Server (`mmojo-server-ape`) for x86_64 and arm64. We will then package them in an Actual Portable Executable (APE) file which can run cross platform and cross artchitecture. 

The APE will run on x86 and ARM CPUs, and Windows, Linux, and macOS operating systems. As a zip file, the APE can also hold configuration files and .gguf models. The APE will not perform as well as platform-specifc builds. It does not have the most optimized GGML CPU code and does not use GGML GPU options. Tradeoffs.

**Where:** Perform this step in either or both your x86_64 and your aarch64 (arm64) build environments. The resulting APE file will be copied to your Mmojo SMB share.

---
### Build Mmojo Server for x86_64
This script uses cmake CMake to build Mmojo Server with `cosmocc` for x86_64. Note that we make a temporary change to `common/CMakeLists.txt` to statically link with OpenSSL libraries.
- View the script: <a href="../scripts/405-Build-Cosmo-x86_64.sh" target="_blank">405-Build-Cosmo-x86_64.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/405-Build-Cosmo-x86_64.sh
  ```

#### Optional: Test the x86_64 Build
If you're build enviornment is x86_64, you can test this build. Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/405-Test-Cosmo-x86_64.sh" target="_blank">405-Test-Cosmo-x86_64.sh</a>.
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/405-Test-Cosmo-x86_64.sh
  ```

#### Optional: Copy x86_64 Build to Your Mmojo Share
Copy this build to your Mmojo share for assembly into an APE later. This is particularly useful if you're building the x86_64 and aarch64 binaries in different build environments.
- View the script: <a href="../scripts/405-Copy-Cosmo-x86_64-to-Mmojo-Share.sh" target="_blank">405-Copy-Cosmo-x86_64-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/405-Copy-Cosmo-x86_64-to-Mmojo-Share.sh
  ```

---
### Build Mmojo Server for aarch64 (arm64)
This script uses cmake CMake to build Mmojo Server with `cosmocc` for aarch64 (arm64). Note that we make a temporary change to `common/CMakeLists.txt` to statically link with OpenSSL libraries.
- View the script: <a href="../scripts/405-Build-Cosmo-aarch64.sh" target="_blank">405-Build-Cosmo-aarch64.sh</a>.
- Run the script:
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/405-Build-Cosmo-aarch64.sh
  ```

#### Optional: Test the aarch64 (arm64) Build
If you're build enviornment is x86_64, you can test this build. Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/405-Test-Cosmo-aarch64.sh" target="_blank">405-Test-Cosmo-aarch64.sh</a>.
- Run the script:
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/405-Test-Cosmo-aarch64.sh
  ```

#### Optional: Copy aarch64 (arm64) Build to Your Mmojo Share
Copy this build to your Mmojo share for assembly into an APE later. This is particularly useful if you're building the x86_64 and aarch64 binaries in different build environments.
- View the script: <a href="../scripts/405-Copy-Cosmo-aarch64-to-Mmojo-Share.sh" target="_blank">405-Copy-Cosmo-aarch64-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/405-Copy-Cosmo-aarch64-to-Mmojo-Share.sh
  ```

---
### Build mmojo-server Actual Portable Executable (APE)
Now that we have x86_64 and aarch64 (ARM64) builds, we can combine them into an Actual Portable Executable (APE) file.

#### Option 1: Assemble from Local Copies
Do this if you built both x86_64 and aarch64/arm64 in the same build environment.
- View the script: <a href="../scripts/405-Assemble-Cosmo-APE-Local.sh" target="_blank">405-Assemble-Cosmo-APE-Local.sh</a>.
- Run the script:
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/405-Assemble-Cosmo-APE-Local.sh
  ```

#### Option 2: Assemble from Your Mmojo Share
Do this if you built both x86_64 and aarch64/arm64 in different build environments and copied them to your Mmojo share.
- View the script: <a href="../scripts/405-Assemble-Cosmo-APE-Mmojo-Share.sh" target="_blank">405-Assemble-Cosmo-APE-Mmojo-Share.sh</a>.
- Run the script:
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/405-Assemble-Cosmo-APE-Mmojo-Share.sh
  ```

#### Optional: Test the Assembled APE
If you're build enviornment is x86_64 or aarch64, you can test the assembled APE. Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/405-Test-Cosmo-APE.sh" target="_blank">405-Test-Cosmo-APE.sh</a>.
- Run the script:
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/405-Test-Cosmo-APE.sh
  ```

#### Optional: Copy Assembled APE to Your Mmojo Share
Copy this assembled APE to your Mmojo share.
- View the script: <a href="../scripts/405-Copy-Cosmo-APE-to-Mmojo-Share.sh" target="_blank">405-Copy-Cosmo-APE-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  . mm-environment-variables.sh
  $MMOJO_SERVER_SCRIPTS/405-Copy-Cosmo-APE-to-Mmojo-Share.sh
  ```

---
### Proceed
- **Next:** This is the last article in this section.
- **Previous:** [404. Build CPU Release](404-Build-CPU-Release.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
