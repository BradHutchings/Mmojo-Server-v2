## 500. Build Mmojo Server
### About this Section
We're ready to build `mmojo-server` executables. First, we'll build a native version for the build environment platfrom that can be used to test features and changes. Then, we'll build an Actually Portable Executable (APE) with Cosmopolitan that will run anywhere. After that, we'll build unoptimized linux builds for x86_64 and aarch64 (arm64) platforms, as well as optimized builds for specific devices like macOS and Raspberry Pi.

#### Experimental &mdash; Dogpile
If you would like to build a less branded and opinionated version of llama.cpp, I offer **Dogpile**. It's intended as an example branded server I am offering to paid sponsors of Mmojo Server. Let's work out a sponsorship deal and what you'd like in your custom branded server!

[Jump to these instructions](dogpile/500-Build-Dogpile.md) to build a Dogpile server with a traditional chat-style user interface.

---
### Build Mmojo Server
Here are the things you need to do:
- [501. Prepare to Build](501-Prepare-to-Build.md) - Clone llama.cpp repo, fix some things, and copy some things.
- [502. Prepare to Test](502-Prepare-to-Test.md) - Set some environment variables to customize test runs.
- [503. Debug Build](503-Debug-Build.md) - Build an unoptimized `mmojo-server` for the CPU of the build environment platform that can be used to test features and changes.<br/><br/>
- [510. APE Builds](510-APE-Builds.md) - Explains Actual Portable Executables (APEs) and how to build them.
  - [511. APE (Compatible)](511-APE-Compatible.md) - Build `mmojo-server-ape` as an APE with Cosmopolitan. This build is widely compatible with x86_64 and aarch64 (arm64) systems, but not very performant.
  - [512. APE (Performant)](512-APE-Performant.md) - Build `mmojo-server-ape` as an APE with Cosmopolitan. This build is compatible with recent x86_64 and aarch64 (arm64) systems and more performant.<br/><br/>
- [520. Platform Builds](520-Platform-Builds.md) - Explains build-platform executables and how to build them. Now with GPU choices and support.
  - [521. Platform (Compatible)](521-Platform-Compatible.md) - Build `mmojo-server` for the base CPU of the build environment platform.
  - [522. Platform (Performant)](522-Platform-Performant.md) - Build `mmojo-server` for recent CPUs from the CPU family of the build environment platform.
  - [523. Platform (Native)](523-Platform-Native.md) - Build `mmojo-server` highly optimized for the CPU of the build environment platform.<br/><br/>

**Get Started:** [501. Prepare to Build](501-Prepare-to-Build.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
