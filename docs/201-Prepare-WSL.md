## 201. Prepare WSL

**THIS STEP IS NOT COMPLETE YET. -BRAD 2025-11-11**

### About this Step
Windows Subsystem for Linux (WSL) lets you run a full Linux distribution directly on Windows. For building and deploying Mmojo Server, it offers a few advantages and disadvantages over the native Windows environment:

1. (Advantage WSL): No executable size limit. Windows itself has a 4 GB `.exe` size limit. For Mmojo Server, this means we cannot run an Actual Portable Execiutable (APE) file containing an LLM in the 4B parameter range or higher!
2. (Advantage WSL): If you have NVIDIA drivers installed on your Windows host for a GPU that supports CUDA, you can run CUDA software from within WSL.
3. (Advantage Windows): Vulkan software can be run with experimental, hard to find bridge software installed within WSL. It does not work well for Mmojo Server.
4. (Advantage WSL): I don't test natvely building on or for Windows (yet).

Hyper-V virtual machines run on Windows 11 Pro do not have access to the host system's GPU. While they may offer a more robust sandbox for CPU inference with Mmojo Server, they tend to be less convenient and more work than WSL.

Let's configure your WSL system to work better for Mmojo Server development.

**Where:** Perform this step with and inside your WSL environment.

---
### Dedicate an Instance
If you already use WSL, you should dedicate an instance just for building Mmoho Server.

(Instructions here and links on creating a new instance.)

---
### Move the WSL Instance Virtual Drive
If you have multiple drives on your Windows computer, you should move the `.vhdx` virtual drive file for your instance off the startup disk and onto another drive. That virtual drive file can easily balloon to 100 GB or more if you test with and package many of the popuar models.

(Instructions here and links on moving the drive.)

---
### Start from Scratch Often
It's OK to start from scratch and do it often. There is a lot going on to build and package Mmojo Server. There are a lot of moving parts. When you get stuck, save your sanity and start over.

---
### Proceed
- **Next:** [202. Create Scripts and Tools Directories](202-Create-Scripts-and-Tools-Directories.md)
- **Previous:** This is the first step in this section.
- **Up:** [200. Prepare Build Environment](200-Prepare-Build-Environment.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
