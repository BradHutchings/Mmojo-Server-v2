## 400. Build Mmojo Server
### About this Section
We're ready to build `mmojo-server` executables. First, we'll build a native version for the build environment platfrom that can be used to test features and changes. Then, we'll build an Actually Portable Executable (APE) with Cosmopolitan that will run anywhere. After that, we'll build unoptimized linux builds for x86_64 and aarch64 (arm64) platforms, as well as optimized builds for specific devices like macOS and Raspberry Pi.

---
### Build Mmojo Server
Here are the things you need to do:
- [401. Re-Clone Mmojo Server Repo](401-Re-Clone-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [402. Prepare to Build](402-Prepare-to-Build.md) - Clone llama.cpp repo, fix some things, and copy some things.
- [403. Prepare to Test](403-Prepare-to-Test.md) - Set some environment variables to customize test runs.
- [404. Build Debug](404-Build-Debug.md) - Build an unoptimized `mmojo-server` for the CPU of the build environment platformm that can be used to test features and changes.
- [405. Build APE](405-Build-APE.md) - Build `mmojo-server-ape` as an Actually Portable Executable (APE) with Cosmopolitan.
- [406. Build CPU](406-Build-CPU.md) - Build an optimized `mmojo-server` for the CPU of the build environment platform.
- [407. Build CUDA](407-Build-CUDA.md) - Build an optimized `mmojo-server` for the CPU of the build environment platform with CUDA GPU support.
- [408. Build Vulkan](408-Build-Vulkan.md) - Build an optimized `mmojo-server` for the CPU of the build environment platform with Vulkan GPU support.

**Get Started:** [401. Re-Clone Mmojo Server Repo](401-Re-Clone-Mmojo-Server-Repo.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
