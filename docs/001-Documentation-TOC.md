## 1. Documentation - Table of Contents

Brad Hutchings<br/>
brad@bradhutchings.com

---
### Introduction
Welcome to the **Mmojo Server Documentation**. This page is a jump-off point for the things you need to do.

---
### Table of Contents
#### [100. Prepare Build Environment](100-Prepare-Build-Environment.md)
Before you can build Mmojo Server, you need a build environment. Depending on what you want to build, it could be a single computer or multiple computers. You should have a separate share on your network to keep files you only need to download once, and keep the products of your builds. You may find yourself rebuilding your build environments regularly, especially if you edit or enhance code and instructions in the repo.

- [101. Clone Mmojo Server Repo](101-Clone-Mmojo-Server-Repo.md) - Clone Mmojo Server Repo for setup and build scripts.
- [102. Set Timezone](102-Set-Timezone.md) - Set your build system's time zone so Completion UI reflects correct build date.
- [103. Create Mmojo Share](103-Create-Mmojo-Share.md) - Create and mount a file share to support multiple build environments.
- [104. Install Dependencies](104-Install-Dependencies.md) - Install packages needed for your build system.
- [105. Set up Cross Compile - aarch64 on x86_64](105-Set-up-Cross-Compile-aarch64-on-x86_64.md) - Cross compiling architecture-specific Linux builds might work well in the future.
- [106. Set up Cross Compile - x86_64 on aarch64](106-Set-up-Cross-Compile-x86_64-on-aarch64.md) - Cross compiling architecture-specific Linux builds might work well in the future.

#### [200. Gather Build Pieces](20-Gather-Build-Pieces.md)
Prepare things needed to build Mmojo Server executables. **You only need to do these steps once (in awhile).**

- [201. Update Local Mmojo Server Repo](201-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [202. Download Models](202-Download-Models.md) - Download `.gguf` model files from Hugging Face or copy from your Mmojo share.
- [203. Build Cosmopolitan](203-Build-Cosmopolitan.md) - Patch Cosmopolitan and build it.
- [204. Build llamafile](204-Build-llamafile.md) - Build `llamafile` so we can use its `zipalign` tool.
- [205. Build OpenSSL](205-Build-OpenSSL.md) - Build OpenSSL static libraries with Cosmopolitan.
- [206. Build Vulkan](206-Build-Vulkan.md) - Build Vulkan for platform optimized builds.

#### [300. Build Mmojo Server](30-Build-Mmojo-Server.md)
Build Mmojo Server executables.

- [301. Update Local Mmojo Server Repo](301-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [302. Prepare to Build](302-Prepare-to-Build.md) - Clone llama.cpp repo, fix some things, and copy some things.
- [303. Build Test](303-Build-Test.md) - Build an unoptimized `mmojo-server` for the build environment platformm that can be used to test features and changes.
- [304. Build APE](304-Build-APE.md) - Build `mmojo-server-ape` as an Actually Portable Executable (APE) with Cosmopolitan.
- [305. Build linux x86_64](305-Build-linux-x86_64.md) - Build unoptimized linux build for x86_64.
- [306. Build linux aarch64](306-Build-linux-aarch64.md) - Build unoptimized linux build for aarch64 (arm64).
- [307. Build pi5](307-Build-pi5.md) - Build optimized linux build for Raspberry Pi 3, 4, and 5.

[400. Package Mmojo Server](400-Package-Mmojo-Server.md) - **Not stubbed yet.**
