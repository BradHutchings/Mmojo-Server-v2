## 400. Build Mmojo Server
### About this Section
We're ready to build `mmojo-server` executables. First, we'll build a native version for the build environment platfrom that can be used to test features and changes. Then, we'll build an Actually Portable Executable (APE) with Cosmopolitan that will run anywhere. After that, we'll build unoptimized linux builds for x86_64 and aarch64 (arm64) platforms, as well as optimized builds for specific devices like macOS and Raspberry Pi.

#### Experimental &mdash; Dogpile
If you would like to build a less branded and opinionated version of llama.cpp, I offer **Dogpile**. It's intended as an example branded server I am offering to paid sponsors of Mmojo Server. Let's work out a sponsorship deal and what you'd like in your custom branded server!

[Jump to these instructions](dogpile/400-Build-Dogpile.md) to build a Dogpile server with a traditional chat-style user interface.

---
### Build Mmojo Server
Here are the things you need to do:
- [401. Prepare to Build](401-Prepare-to-Build.md) - Clone llama.cpp repo, fix some things, and copy some things.
- [402. Prepare to Test](402-Prepare-to-Test.md) - Set some environment variables to customize test runs.
- [403. Build Debug](403-Build-Debug.md) - Build an unoptimized `mmojo-server` for the CPU of the build environment platformm that can be used to test features and changes.
- [404. Build APE](404-Build-APE.md) - Build `mmojo-server-ape` as an Actually Portable Executable (APE) with Cosmopolitan.
- [405. Build CPU](405-Build-CPU.md) - Build an optimized `mmojo-server` for the CPU of the build environment platform.
- [406. Build CUDA](406-Build-CUDA.md) - Build an optimized `mmojo-server` for the CPU of the build environment platform with CUDA GPU support.
- [407. Build Vulkan](407-Build-Vulkan.md) - Build an optimized `mmojo-server` for the CPU of the build environment platform with Vulkan GPU support.

**Get Started:** [401. Prepare to Build](401-Prepare-to-Build.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
