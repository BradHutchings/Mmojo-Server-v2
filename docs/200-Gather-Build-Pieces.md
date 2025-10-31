## 200. Gather Buid Pieces

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Section
We need a few items ready to build an Actually Portable Executable (APE) with Cosmopolitan and for other build considerations. These only need to be prepared once in each of your build environments and rebuilt occasionally.

If you have already prepared your build environment, skip ahead to: 
- [300. Build Mmojo Server](300-Build-Mmojo-Server.md)

---
### Preparing Your Build Environment
Here are the things you need to do:
- [201. Update Local Mmojo Server Repo](201-Update-Local-Mmojo-Server-Repo.md) - Make sure you have the latest instructions and scripts.
- [202. Download Models](202-Download-Models.md) - Download `.gguf` model files from Hugging Face or copy from your Mmojo share.
- [203. Build Cosmopolitan](203-Build-Cosmopolitan.md) - Patch Cosmopolitan and build it.
- [204. Build llamafile](204-Build-llamafile.md) - Build `llamafile` so we can use its `zipalign` tool.
- [205. Build OpenSSL](205-Build-OpenSSL.md) - Build OpenSSL static libraries with Cosmopolitan.
- [206. Build Vulkan](206-Build-Vulkan.md) - Build Vulkan for platform optimized builds.

**Get Started:** [201. Update Local Mmojo Server Repo](201-Update-Local-Mmojo-Server-Repo.md)
