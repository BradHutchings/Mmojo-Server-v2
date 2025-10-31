## 20. Gather Buid Pieces

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Section
We need a few items ready to build an Actually Portable Executable (APE) with Cosmopolitan and for other build considerations. These only need to be prepared once in each of your build environments and rebuilt occasionally.

If you have already prepared your build environment, skip ahead to: 
- [30. Build Mmojo Server](NEW-30-Build-Mmojo-Server.md)

---
### Preparing Your Build Environment
Here are the things you need to do:
- [21. Update Local Mmojo Server Repo](21-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [22. Download Models](22-Download-M<odels.md) - Download `.gguf` model files from Hugging Face or copy from your Mmojo share.
- [23. Build Cosmopolitan](23-Build-Cosmopolitan.md) - Patch Cosmopolitan and build it.
- [24. Build llamafile](24-Build-llamafile.md) - Build `llamafile` so we can use its `zipalign` tool.
- [25. Build OpenSSL](25-Build-OpenSSL.md) - Build OpenSSL static libraries with Cosmopolitan.
- [26. Build Vulkan](26-Build-Vulkan.md) - Build Vulkan for platform optimized builds.

**Get Started:** [21. Download gguf Files](21-Download-gguf-Files.md)
