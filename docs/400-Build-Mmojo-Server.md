## 400. Build Mmojo Server
### About this Section
We're ready to build `mmojo-server` executables. First, we'll build a native version for the build environment platfrom that can be used to test features and changes. Then, we'll build an Actually Portable Executable (APE) with Cosmopolitan that will run anywhere. After that, we'll build unoptimized linux builds for x86_64 and aarch64 (arm64) platforms, as well as optimized builds for specific devices like macOS and Raspberry Pi.

---
### Preparing Your Build Environment
Here are the things you need to do:
- [401. Update Local Mmojo Server Repo](401-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [402. Prepare to Build](402-Prepare-to-Build.md) - Clone llama.cpp repo, fix some things, and copy some things.
- [403. Build CPU Debug](403-Build-CPU-Debug.md) - Build an unoptimized `mmojo-server` for the CPU of the build environment platformm that can be used to test features and changes.
- [404. Build CPU Release](404-Build-CPU-Release.md) - Build an optimized `mmojo-server` for the CPU of the build environment platformm.
- [405. Build APE](405-Build-APE.md) - Build `mmojo-server-ape` as an Actually Portable Executable (APE) with Cosmopolitan.
- [406. Build linux x86_64](406-Build-linux-x86_64.md) - Build unoptimized linux build for x86_64.
- [407. Build linux aarch64](407-Build-linux-aarch64.md) - Build unoptimized linux build for aarch64 (arm64).
- [408. Build pi5](408-Build-pi5.md) - Build optimized linux build for Raspberry Pi 3, 4, and 5.

**Get Started:** [401. Update Local Mmojo Server Repo](401-Update-Local-Mmojo-Server-Repo.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
