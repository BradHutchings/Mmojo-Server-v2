## Table of Contents
### [100. Overview](100-Overview.md)
This is an overview of what this repository is about, how to work with it, what to contribute, etc. Read this first before diving in!

- [101. Project Goals](101-Project-Goals.md) - What this project is about and what it is not about.
- [102. Build Environment](102-Build-Environment.md) - Constructing a multi-machine build environment.
- [103. Build Targets](103-Build-Targets.md) - About build targets.
- [104. Packaging for Deployment](104-Packaging-for-Deployment.md) - About packaging builds for deployment.
- [105. Contributing](105-Contributing.md) - About contributing to this project.

---
### [200. Prepare Build Environment](200-Prepare-Build-Environment.md)
Before you can build Mmojo Server, you need a build environment. Depending on what you want to build, it could be a single computer or multiple computers. You should have a separate share on your network to keep files you only need to download once, and keep the products of your builds. You may find yourself rebuilding your build environments regularly, especially if you edit or enhance code and instructions in the repo.

- [201. Prepare WSL](201-Prepare-WSL.md) - Prepare your Windows Subsystem for Linux (WSL) environment if you're using one.
- [202. Create Scripts and Tools Directories](202-Create-Scripts-and-Tools-Directories.md) - Create `$HOME/scripts` and `$HOME/tools` directories, then add them to your `$PATH`.
- [203. Clone Mmojo Server Repo](203-Clone-Mmojo-Server-Repo.md) - Clone Mmojo Server Repo for setup and build scripts.
- [204. Set Timezone](204-Set-Timezone.md) - Set your build system's time zone so Completion UI reflects correct build date.
- [205. Create Mmojo Share](205-Create-Mmojo-Share.md) - Create a file share to support multiple build environments.
- [206. Mount Mmojo Share](206-Mount-Mmojo-Share.md) - Mount a file share to support multiple build environments.
- [207. Install Dependencies](207-Install-Dependencies.md) - Install packages needed for your build system.
<!--
- [207. Set up Cross Compile - aarch64 on x86_64](207-Set-up-Cross-Compile-aarch64-on-x86_64.md) - Cross compiling architecture-specific Linux builds might work well in the future.
- [208. Set up Cross Compile - x86_64 on aarch64](208-Set-up-Cross-Compile-x86_64-on-aarch64.md) - Cross compiling architecture-specific Linux builds might work well in the future.
-->

---
### [300. Gather Build Pieces](300-Gather-Build-Pieces.md)
Prepare things needed to build Mmojo Server executables. **You only need to do these steps once (in awhile).**

- [301. Update Local Mmojo Server Repo](301-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [302. Download Models](302-Download-Models.md) - Download `.gguf` model files from Hugging Face and copy them to your Mmojo share.
- [303. Copy Models](302-Copy-Models.md) - Copy `.gguf` model files from your Mmojo share.
- [304. Build Cosmopolitan](304-Build-Cosmopolitan.md) - Patch Cosmopolitan and build it.
- [305. Build OpenSSL](305-Build-OpenSSL.md) - Build OpenSSL static libraries with Cosmopolitan.
- [306. Build Vulkan](306-Build-Vulkan.md) - Build Vulkan for platform optimized builds.
<!--
- [307. Build llamafile](307-Build-llamafile.md) - Build `llamafile` so we can use its `zipalign` tool.
-->
---
### [400. Build Mmojo Server](400-Build-Mmojo-Server.md)
Build Mmojo Server executables.

- [401. Update Environment](401-Update-Environment.md) - Make sure you have the latest instructions and scripts.
- [402. Prepare to Build](402-Prepare-to-Build.md) - Clone llama.cpp repo, fix some things, and copy some things.
- [403. Build Debug](403-Build-Debug.md) - Build an unoptimized `mmojo-server` for the CPU of the build environment platformm that can be used to test features and changes.
- [404. Build APE](404-Build-APE.md) - Build `mmojo-server-ape` as an Actually Portable Executable (APE) with Cosmopolitan.
- [405. Build CPU](405-Build-CPU.md) - Build an optimized `mmojo-server` for the CPU of the build environment platform.
- [406. Build CUDA](406-Build-CUDA.md) - Build an optimized `mmojo-server` for the CPU of the build environment platform with CUDA GPU support.
- [407. Build Vulkan](407-Build-Vulkan.md) - Build an optimized `mmojo-server` for the CPU of the build environment platform with Vulkan GPU support.

---
### [500. Package Mmojo Server](500-Package-Mmojo-Server.md)
**Not stubbed yet.**

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
