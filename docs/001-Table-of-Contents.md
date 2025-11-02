## Table of Contents

Brad Hutchings<br/>
brad@bradhutchings.com

---
### Introduction
Welcome to the **Mmojo Server Documentation**. This page is a jump-off point for the things you need to do.

---
### Table of Contents
#### [100. Overview](100-Overview.md)
This is an overview of what this repository is about, how to work with it, what to contribute, etc. Read this first before diving in!

#### [200. Prepare Build Environment](200-Prepare-Build-Environment.md)
Before you can build Mmojo Server, you need a build environment. Depending on what you want to build, it could be a single computer or multiple computers. You should have a separate share on your network to keep files you only need to download once, and keep the products of your builds. You may find yourself rebuilding your build environments regularly, especially if you edit or enhance code and instructions in the repo.

- [201. Clone Mmojo Server Repo](201-Clone-Mmojo-Server-Repo.md) - Clone Mmojo Server Repo for setup and build scripts.
- [202. Set Timezone](202-Set-Timezone.md) - Set your build system's time zone so Completion UI reflects correct build date.
- [203. Create Mmojo Share](203-Create-Mmojo-Share.md) - Create and mount a file share to support multiple build environments. Manual steps.
- [204. Create Mmojo Share (Automated)](204-Create-Mmojo-Share-Automated.md) - Create and mount a file share to support multiple build environments. Automated.
- [205. Install Dependencies](205-Install-Dependencies.md) - Install packages needed for your build system.
- [206. Set up Cross Compile - aarch64 on x86_64](206-Set-up-Cross-Compile-aarch64-on-x86_64.md) - Cross compiling architecture-specific Linux builds might work well in the future.
- [207. Set up Cross Compile - x86_64 on aarch64](207-Set-up-Cross-Compile-x86_64-on-aarch64.md) - Cross compiling architecture-specific Linux builds might work well in the future.

#### [300. Gather Build Pieces](30-Gather-Build-Pieces.md)
Prepare things needed to build Mmojo Server executables. **You only need to do these steps once (in awhile).**

- [301. Update Local Mmojo Server Repo](301-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [302. Download Models](302-Download-Models.md) - Download `.gguf` model files from Hugging Face or copy from your Mmojo share.
- [303. Build Cosmopolitan](303-Build-Cosmopolitan.md) - Patch Cosmopolitan and build it.
- [304. Build llamafile](304-Build-llamafile.md) - Build `llamafile` so we can use its `zipalign` tool.
- [305. Build OpenSSL](305-Build-OpenSSL.md) - Build OpenSSL static libraries with Cosmopolitan.
- [306. Build Vulkan](306-Build-Vulkan.md) - Build Vulkan for platform optimized builds.

#### [400. Build Mmojo Server](40-Build-Mmojo-Server.md)
Build Mmojo Server executables.

- [401. Update Local Mmojo Server Repo](401-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [402. Prepare to Build](402-Prepare-to-Build.md) - Clone llama.cpp repo, fix some things, and copy some things.
- [403. Build Test](403-Build-Test.md) - Build an unoptimized `mmojo-server` for the build environment platformm that can be used to test features and changes.
- [404. Build APE](404-Build-APE.md) - Build `mmojo-server-ape` as an Actually Portable Executable (APE) with Cosmopolitan.
- [405. Build linux x86_64](405-Build-linux-x86_64.md) - Build unoptimized linux build for x86_64.
- [406. Build linux aarch64](406-Build-linux-aarch64.md) - Build unoptimized linux build for aarch64 (arm64).
- [407. Build pi5](407-Build-pi5.md) - Build optimized linux build for Raspberry Pi 3, 4, and 5.

[500. Package Mmojo Server](500-Package-Mmojo-Server.md) - **Not stubbed yet.**
