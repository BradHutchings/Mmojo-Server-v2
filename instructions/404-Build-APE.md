## 404. Build APE
### About this Step
In this step, we will build Mmojo Server (`mmojo-server-ape`) for x86_64 and arm64. We will then package them in an Actual Portable Executable (APE) file which can run cross platform and cross artchitecture. 

The APE will run on x86 and ARM CPUs, and Windows, Linux, and macOS operating systems. As a zip file, the APE can also hold configuration files and .gguf models. The APE will not perform as well as platform-specifc builds. It does not have the most optimized GGML CPU code and does not use GGML GPU options. Tradeoffs.

**Where:** Perform this step in either or both your x86_64 and your aarch64 (arm64) build environments. The resulting APE file will be copied to your Mmojo SMB share.

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
### Build Mmojo Server for x86_64
This script uses cmake CMake to build Mmojo Server with `cosmocc` for x86_64. Note that we make a temporary change to `common/CMakeLists.txt` to statically link with OpenSSL libraries.
- View the script: <a href="../scripts/404-Build-Cosmo-x86_64.sh" target="_blank">404-Build-Cosmo-x86_64.sh</a>.
  - *On Github, you may need to right-click and choose "Open link in new tab" to open the "View script" links in a new tab.*
    <br/>
    <br/>
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/404-Build-Cosmo-x86_64.sh
  ```

<details>
  <summary><b>Optional: Test the x86_64 Build.</b></summary>

If you're build enviornment is x86_64, you can test this build. Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/404-Test-Cosmo-x86_64.sh" target="_blank">404-Test-Cosmo-x86_64.sh</a>.
- Run the script. We run with `.` so variables can be defined and exported.
  ```
  $MMOJO_SERVER_SCRIPTS/404-Test-Cosmo-x86_64.sh
  ```
</details>

<details>
  <summary><b>Optional: Copy x86_64 Build to Your Mmojo Share.</b></summary>

Copy this build to your Mmojo share for assembly into an APE later. This is particularly useful if you're building the x86_64 and aarch64 binaries in different build environments.
- View the script: <a href="../scripts/404-Copy-Cosmo-x86_64-to-Mmojo-Share.sh" target="_blank">404-Copy-Cosmo-x86_64-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/404-Copy-Cosmo-x86_64-to-Mmojo-Share.sh
  ```
</details>

---
### Build Mmojo Server for aarch64 (arm64)
This script uses cmake CMake to build Mmojo Server with `cosmocc` for aarch64 (arm64). Note that we make a temporary change to `common/CMakeLists.txt` to statically link with OpenSSL libraries.
- View the script: <a href="../scripts/404-Build-Cosmo-aarch64.sh" target="_blank">404-Build-Cosmo-aarch64.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/404-Build-Cosmo-aarch64.sh
  ```

<details>
  <summary><b>Optional: Test the aarch64 (arm64) Build.</b></summary>

If you're build enviornment is x86_64, you can test this build. Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/404-Test-Cosmo-aarch64.sh" target="_blank">404-Test-Cosmo-aarch64.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/404-Test-Cosmo-aarch64.sh
  ```
</details>

<details>
  <summary><b>Optional: Copy aarch64 (arm64) Build to Your Mmojo Share.</b></summary>

Copy this build to your Mmojo share for assembly into an APE later. This is particularly useful if you're building the x86_64 and aarch64 binaries in different build environments.
- View the script: <a href="../scripts/404-Copy-Cosmo-aarch64-to-Mmojo-Share.sh" target="_blank">404-Copy-Cosmo-aarch64-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/404-Copy-Cosmo-aarch64-to-Mmojo-Share.sh
  ```
</details>

---
### Assemble mmojo-server Actual Portable Executable (APE)
Now that we have x86_64 and aarch64 (ARM64) builds, we can assemble them into an Actual Portable Executable (APE) file.
- View the script: <a href="../scripts/404-Assemble-Cosmo-APE.sh" target="_blank">404-Assemble-Cosmo-APE.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/404-Assemble-Cosmo-APE.sh
  ```

#### Test the Assembled APE
If you're build enviornment is x86_64 or aarch64, you can test the assembled APE. Requires previously downloaded model to the `$MODELS_DIR` directory.
- View the script: <a href="../scripts/404-Test-Cosmo-APE.sh" target="_blank">404-Test-Cosmo-APE.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/404-Test-Cosmo-APE.sh
  ```

<details>
  <summary><b>Optional: Copy Assembled APE to Your Mmojo Share.</b></summary>

Copy this assembled APE to your Mmojo share.
- View the script: <a href="../scripts/404-Copy-Cosmo-APE-to-Mmojo-Share.sh" target="_blank">404-Copy-Cosmo-APE-to-Mmojo-Share.sh</a>.
- Run the script:
  ```
  $MMOJO_SERVER_SCRIPTS/404-Copy-Cosmo-APE-to-Mmojo-Share.sh
  ```
</details>

---
### WSL Note
If you get build errors in the CMake preparation step, you most likely did not turn off interoperability in WSL. Please see instructions in [2021. Prepare WSL](201-Prepare-WSL.md).

You can turn off interoperability temporarily with this command:
```
sudo sh -c 'echo -1 > /proc/sys/fs/binfmt_misc/WSLInterop-late'
```

---
### SHORTCUT: Build and Assemble APE, Copy to Mmojo Share, Test APE
I really think you should run through these scripts one at a time the first few times you build, so you can familiarize yourself with the process and know what goes where. But, now that you've run through a few times, you can use the shortcut snippet:
```
################################################################################
# SHORTCUT: DON'T DO THIS IF YOU ALREADY RAN SCRIPTS ABOVE!
################################################################################
$MMOJO_SERVER_SCRIPTS/404-Build-Cosmo-x86_64.sh
$MMOJO_SERVER_SCRIPTS/404-Copy-Cosmo-x86_64-to-Mmojo-Share.sh
$MMOJO_SERVER_SCRIPTS/404-Build-Cosmo-aarch64.sh
$MMOJO_SERVER_SCRIPTS/404-Copy-Cosmo-aarch64-to-Mmojo-Share.sh
$MMOJO_SERVER_SCRIPTS/404-Assemble-Cosmo-APE.sh
$MMOJO_SERVER_SCRIPTS/404-Copy-Cosmo-APE-to-Mmojo-Share.sh
$MMOJO_SERVER_SCRIPTS/404-Test-Cosmo-APE.sh
```

---
### Proceed
- **Next:** [405. Build CPU](405-Build-CPU.md)
- **Previous:** [403. Build Debug](403-Build-Debug.md)
- **Up:** [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
