## 600. Package Mmojo Server
### About this Section
Now that you have Mmojo Server built as an Actual Portable Executable (APE) file, a CPU optimized build for your build system, or a GPU-enabled build for your build system, you can package it for deployment.

(Figure out the naming convention. "Mmojo Server" is APE, "Mmojo Server (OS, Architecture)", "Mmojo Server (Device)")

---
### Package Mmojo Server
Here are some packaging options:
- [611. Package APE (Compatible)](611-Package-APE-Compatible.md) - Package Mmojo Server as an Actual Portable Executable (APE) file, which can run on several operating systems spanning x86_64 and aarch64 (ARM64) arcitectures. The "compatible" APE runs (slowly) on a wide variery of x86_64 and aarch64 (arm64) machines.
- [612. Package APE (Performant)](612-Package-APE-Performant.md) - Package Mmojo Server as an Actual Portable Executable (APE) file, which can run on several operating systems spanning x86_64 and aarch64 (ARM64) arcitectures. The "performant" APE runs faster, but only on later model x86_64 machines and high end aarch64 (arm64) machines like Apple's M*-based Macs.
- [621. Package Executable](621-Package-Executable.md) - Package Mmojo Server as a `.zip` file that can be unzipped into a directory containing the Mmojo Server executable and supporting files.
<!--
- [621. Package SEAS](621-Package-SEAS.md) - Package Mmojo Server as a Self-Extracting Application Support (SEAS) file, that extracts its support files on first run.
-->

**Get Started:** [611. Package APE (Compatible)](611-Package-APE-Compatible.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
