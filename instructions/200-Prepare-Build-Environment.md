## 200. Prepare Build Environment
### About this Section
Before you can build Mmojo Server, you need to set up a build environment. I use three build environments regularly:
- Ubuntu 24.04 for x86_64 in a Windows Subsystem for Linux (WSL) instance.
- Ubuntu 24.04 Server (Debian 13 Trixie) for x86_64 in a virtual machine.
- Raspberry Pi OS (Debian 13 Trixie) for Raspberry Pi 5 (aarch64/arm64).

If you want your platform native builds to support Debian 12 Bookworm, use Ubuntu 23.04 Server for x86_64 and Bookworm version of Raspberry Pi OS. The compatibility issue is that you need to link against the earliest glibc that you support. This only affects platform native builds. Actual Portable Executable (APE) builds statically link against the Cosmo glibc.

I plan to add into my regular mix and provide custom build instructions in the future:
- macOS on Mac Mini M4.
- RHEL, CentOS Stream, Oracle Linux, etc. for x86_64 in a virtual machine.

You only need to prepare each build environment once. You can update your local clone of the Mmojo Server Repo with a command we install: `mm-update-local-mmojo-server-repo.sh`. You still may want to rebuild your build environments from scratch occasionally.

If you have already prepared your build environments, skip ahead to: 
- [300. Gather Build Pieces](300-Gather-Build-Pieces.md)

---
### Preparing Your Build Environment
Here are the things you need to do:
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

**Get Started:** [201. Prepare WSL](201-Prepare-WSL.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
