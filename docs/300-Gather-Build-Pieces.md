## 300. Gather Buid Pieces

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Section
We need a few items ready to build an Actually Portable Executable (APE) with Cosmopolitan and for other build considerations. These only need to be prepared once in each of your build environments and rebuilt occasionally.

If you have already prepared your build environment, skip ahead to: 
- [400. Build Mmojo Server](400-Build-Mmojo-Server.md)

---
### Preparing Your Build Environment
Here are the things you need to do:
- [301. Update Local Mmojo Server Repo](301-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [302. Download Models](302-Download-Models.md) - Download `.gguf` model files from Hugging Face or copy from your Mmojo share.
- [303. Build Cosmopolitan](303-Build-Cosmopolitan.md) - Patch Cosmopolitan and build it.
- [304. Build llamafile](304-Build-llamafile.md) - Build `llamafile` so we can use its `zipalign` tool.
- [305. Build OpenSSL](305-Build-OpenSSL.md) - Build OpenSSL static libraries with Cosmopolitan.
- [306. Build Vulkan](306-Build-Vulkan.md) - Build Vulkan for platform optimized builds.

**Get Started:** [301. Update Local Mmojo Server Repo](301-Update-Local-Mmojo-Server-Repo.md)
