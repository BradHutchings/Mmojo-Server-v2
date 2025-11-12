## 300. Gather Buid Pieces
### About this Section
We need a few items ready to build an Actually Portable Executable (APE) with Cosmopolitan and for other build considerations. These only need to be prepared once in each of your build environments and rebuilt occasionally.

If you have already prepared your build environment, skip ahead to: 
- [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
### Preparing Your Build Environment
Here are the things you need to do:
- [301. Update Local Mmojo Server Repo](301-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [302. Download Models](302-Download-Models.md) - Download `.gguf` model files from Hugging Face and copy them to your Mmojo share.
- [303. Copy Models](303-Copy-Models.md) - Copy `.gguf` model files from your Mmojo share.
- [304. Build Cosmopolitan](304-Build-Cosmopolitan.md) - Patch Cosmopolitan and build it.
- [305. Build OpenSSL](305-Build-OpenSSL.md) - Build OpenSSL static libraries with Cosmopolitan.
- [306. Install CUDA SDK](306-Install-CUDA-SDK.md) - Install NVIDIA's CUDA SDK.
- [307. Build Vulkan SDK](307-Build-Vulkan-SDK.md) - Build Vulkan SDK for platform optimized builds.
<!--
- [307. Build llamafile](307-Build-llamafile.md) - Build `llamafile` so we can use its `zipalign` tool.
-->

**Get Started:** [301. Update Local Mmojo Server Repo](301-Update-Local-Mmojo-Server-Repo.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
