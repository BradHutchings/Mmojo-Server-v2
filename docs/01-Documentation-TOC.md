## 1. Documentation - Table of Contents

Brad Hutchings<br/>
brad@bradhutchings.com

---
### Introduction
Welcome to the **Mmojo Server Documentation**. This page is a jump-off point for the things you need to do.

---
### Table of Contents
#### [10. Prepare Build Environment](10-Prepare-Build-Environment.md)
Before you can build Mmojo Server, you need a build environment. Depending on what you want to build, it could be a single computer or multiple computers. You should have a separate share on your network to keep files you only need to download once, and keep the products of your builds. You may find yourself rebuilding your build environments regularly, especially if you edit or enhance code and instructions in the repo.

- [11. Clone Mmojo Server Repo](11-Clone-Mmojo-Server-Repo.md) - Clone Mmojo Server Repo for setup and build scripts.
- [12. Set Timezone](12-Set-Timezone.md) - Set your build system's time zone so Completion UI reflects correct build date.
- [13. Create Mmojo Share](13-Create-Mmojo-Share.md) - Create and mount a file share to support multiple build environments.
- [14. Install Dependencies](14-Install-Dependencies.md) - Install packages needed for your build system.
- [15. Set up Cross Compile - aarch64 on x86_64](15-Set-up-Cross-Compile-aarch64-on-x86_64.md) - Cross compiling architecture-specific Linux builds might work well in the future.
- [16. Set up Cross Compile - x86_64 on aarch64](16-Set-up-Cross-Compile-x86_64-on-aarch64.md) - Cross compiling architecture-specific Linux builds might work well in the future.

#### [20. Gather Build Pieces](20-Gather-Build-Pieces.md)
Prepare things needed to build Mmojo Server executables. **You only need to do these steps once (in awhile).**

- [21. Update Local Mmojo Server Repo](21-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [22. Download Models](22-Download-Models.md) - Download `.gguf` model files from Hugging Face or copy from your Mmojo share.
- [23. Build Cosmopolitan](23-Build-Cosmopolitan.md) - Patch Cosmopolitan and build it.
- [24. Build llamafile](24-Build-llamafile.md) - Build `llamafile` so we can use its `zipalign` tool.
- [25. Build OpenSSL](25-Build-OpenSSL.md) - Build OpenSSL static libraries with Cosmopolitan.
- [26. Build Vulkan](26-Build-Vulkan.md) - Build Vulkan for platform optimized builds.

#### [30. Build Mmojo Server](30-Build-Mmojo-Server.md)
Build Mmojo Server executables.

- [31. Update Local Mmojo Server Repo](31-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [32. Prepare to Build](32-Prepare-to-Build.md) - Clone llama.cpp repo, fix some things, and copy some things.
- [33. Build Test](33-Build-Test.md) - Build an unoptimized `mmojo-server` for the build environment platformm that can be used to test features and changes.
- [34. Build APE](34-Build-APE.md) - Build `mmojo-server-ape` as an Actually Portable Executable (APE) with Cosmopolitan.
- [35. Build linux x86_64](35-Build-linux-x86_64.md) - Build unoptimized linux build for x86_64.
- [36. Build linux aarch64](36-Build-linux-aarch64.md) - Build unoptimized linux build for aarch64 (arm64).
- [37. Build pi5](37-Build-pi5.md) - Build optimized linux build for Raspberry Pi 3, 4, and 5.

[40. Package Mmojo Server](40-Package-Mmojo-Server.md) - **Not stubbed yet.**
