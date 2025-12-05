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
- [503. Build Debug](503-Build-Debug.md) - Build an unoptimized `mmojo-server` for the CPU of the build environment platformm that can be used to test features and changes.
- [510. Build APEs](510-Build-APEs.md) - Explains APEs and how to build them.
  - [511. APE (Compatible)](511-APE-Compatible.md) - Build `mmojo-server-ape` as an Actually Portable Executable (APE) with Cosmopolitan. This build is widely compatible with x86_64 and aarch64 (arm64) systems, but not very performant.
  - [512. APE (Performant)](512-APE-Performant.md) - Build `mmojo-server-ape` as an Actually Portable Executable (APE) with Cosmopolitan. This build is compatible with recent x86_64 and aarch64 (arm64) systems and more performant.
- [520. Build Executables](520-Build-Executables.md) - Explains build-platform executables and how to build them. Now with GPU choices and support.
  - [521. Executable (Compatible)](521-Executable-Compatible.md) - Build a `mmojo-server` for the base CPU of the build environment platform.
  - [522. Executable (Performant)](522-Executable-Performant.md) - Build a `mmojo-server` for recent CPUs from the CPU family of the build environment platform.
- [523. Executable (Native)](523-Executable-Native.md) - Build an optimized `mmojo-server` for the CPU of the build environment platform.

**Get Started:** [501. Prepare to Build](501-Prepare-to-Build.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
