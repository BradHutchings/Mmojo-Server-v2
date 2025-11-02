## 200. Prepare Build Environment

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Section
Before you can build `mmojo-server`, `mmojo-server-one`, and other targets, you need to set up a build environment. I use two build environments regularly:
- Ubuntu 24.04 Server (Debian 13 Trixie) for x86_64 in a virtual machine.
- Raspberry Pi OS (Debian 13 Trixie) for Raspberry Pi 5 (aarch64/arm64).

If you want your platform native builds to support Debian 12 Bookworm, use Ubuntu 23.04 Server for x86_64 and Bookworm version of Raspberry Pi OS. The compatibility issue is that you need to link against the earliest glibc that you support. This only affects platform native builds. Actual Portable Executable (APE) builds statically link against the Cosmo glibc.

I plan to add into my regular mix and provide custom build instructions in the future:
- RHEL, CentOS Stream, Oracle Linux, etc. for x86_64 in a virtual machine.
- macOS on Mac Mini M4.

You only need to prepare each build environment once. 

If you have already prepared your build environments, skip ahead to: 
- [300. Gather Build Pieces](300-Gather-Build-Pieces.md)

---
### Preparing Your Build Environment
Here are the things you need to do:
- [201. Clone Mmojo Server Repo](201-Clone-Mmojo-Server-Repo.md) - Clone Mmojo Server Repo for setup and build scripts.
- [202. Set Timezone](202-Set-Timezone.md) - Set your build system's time zone so Completion UI reflects correct build date.
- [203. Create Mmojo Share](203-Create-Mmojo-Share.md) - Create and mount a file share to support multiple build environments. Manual steps.
- [204. Create Mmojo Share (Automated)](204-Create-Mmojo-Share-Automated.md) - Create and mount a file share to support multiple build environments. Automated.
- [205. Install Dependencies](205-Install-Dependencies.md) - Install packages needed for your build system.
- [206. Set up Cross Compile - aarch64 on x86_64](206-Set-up-Cross-Compile-aarch64-on-x86_64.md) - Cross compiling architecture-specific Linux builds might work well in the future.
- [207. Set up Cross Compile - x86_64 on aarch64](207-Set-up-Cross-Compile-x86_64-on-aarch64.md) - Cross compiling architecture-specific Linux builds might work well in the future.

**Get Started:** [201. Clone Mmojo Server Repo](201-Clone-Mmojo-Server-Repo.md)
