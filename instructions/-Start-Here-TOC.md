## Mmojo Server Instructions &ndash; Table of Contents
The Mmojo Server project is mostly my instructions (aka "documentation"), with lots of functioning scripts to work out the gory details. The instructions are organized to be worked through sequentially from start to finish. I'll tell you what the point of this project is, help you prepare your build environment, gather things you'll need, build Mmojo Server, then package it for deployment. Read the instructions on GitHub. You will be instructed to clone this repo to a specific directory on your build machine(s) later.

You really can't do much with this project without R-ing TFM. So [jump in and read](101-Project-Goals.md)! Then start doing! Links to next topics are at the bottom of each page. Table of Contents is below for your reference.

-Brad<br/>
--<br/>
Brad Hutchings<br/>
brad@bradhutchings.com

---
### [100. Overview](100-Overview.md)
This is an overview of what this repository is about, how to work with it, what to contribute, etc. Read this first before diving in!

- [101. Project Goals](101-Project-Goals.md) - What this project is about and what it is not about.
- [102. Project Features](102-Project-Features.md) - Comprehensive list of features implemented in this project.
- [103. Build Environment](103-Build-Environment.md) - Constructing a multi-machine build environment.
- [104. Build Targets](104-Build-Targets.md) - About build targets.
- [105. Packaging for Deployment](105-Packaging-for-Deployment.md) - About packaging builds for deployment.
- [106. Contribute and Sponsor](106-Contribute-and-Sponsor.md) - About contributing to this project and sponsoring my work.

---
### [200. Prepare Build Environment](200-Prepare-Build-Environment.md)
Before you can build Mmojo Server, you need a build environment. Depending on what you want to build, it could be a single computer or multiple computers. You should have a separate share on your network to keep files you only need to download once, and keep the products of your builds. You may find yourself rebuilding your build environments regularly, especially if you edit or enhance code and instructions in the repo.

- [201. Prepare WSL](201-Prepare-WSL.md) - Prepare your Windows Subsystem for Linux (WSL) environment if you're using one.
- [202. Create Scripts Directory](202-Create-Scripts-Directory.md) - Create `$HOME/mmscripts` directory, then add it to your `$PATH`.
- [203. Clone Mmojo Server Repo](203-Clone-Mmojo-Server-Repo.md) - Clone Mmojo Server Repo for setup and build scripts.
- [204. Set Timezone](204-Set-Timezone.md) - Set your build system's time zone so Completion UI reflects correct build date.
- [205. Create Mmojo Share](205-Create-Mmojo-Share.md) - Create a file share to support multiple build environments.
- [206. Mount Mmojo Share](206-Mount-Mmojo-Share.md) - Mount a file share to support multiple build environments.
- [207. Install Dependencies](207-Install-Dependencies.md) - Install packages needed for your build system.

---
### [300. Gather Build Pieces](300-Gather-Build-Pieces.md)
Prepare things needed to build Mmojo Server executables. **You only need to do these steps once (in awhile).**

- [301. Download Models](301-Download-Models.md) - Download `.gguf` model files from Hugging Face and copy them to your Mmojo share.
- [302. Copy Models](302-Copy-Models.md) - Copy `.gguf` model files from your Mmojo share.
- [303. Copy Certificates](303-Copy-Certificates.md) - Copy SSL certificate files from your Mmojo share.
- [304. Build Cosmopolitan](304-Build-Cosmopolitan.md) - Patch Cosmopolitan and build it.
- [305. Build OpenSSL](305-Build-OpenSSL.md) - Build OpenSSL static libraries with Cosmopolitan.
- [306. Install CUDA Toolkit](306-Install-CUDA-Toolkit.md) - Install NVIDIA's CUDA Toolkit.
- [307. Build Vulkan SDK](307-Build-Vulkan-SDK.md) - Build Vulkan SDK for platform optimized builds.

---
### [400. Build Mmojo Server](400-Build-Mmojo-Server.md)
Build Mmojo Server executables.

- [401. Prepare to Build](401-Prepare-to-Build.md) - Clone llama.cpp repo, fix some things, and copy some things.
- [402. Prepare to Test](402-Prepare-to-Test.md) - Set some environment variables to customize test runs.
- [403. Build Debug](403-Build-Debug.md) - Build an unoptimized `mmojo-server` for the CPU of the build environment platformm that can be used to test features and changes.
- [410. Build APEs](410-Build-APEs.md) - Explains APEs and how to build them.
- [411. Build APEs (Compatible)](411-Build-APEs-Compatible.md) - Build `mmojo-server-ape` as an Actually Portable Executable (APE) with Cosmopolitan. This build is widely compatible with x86_64 and aarch64 (arm64) systems, but not very performant.
- [412. Build APEs (Performant)](412-Build-APEs-Performant.md) - Build `mmojo-server-ape` as an Actually Portable Executable (APE) with Cosmopolitan. This build is compatible with recent x86_64 and aarch64 (arm64) systems and more performant.
- [420. Build Executables](420-Build-Executables.md) - Explains build-platform executables and how to build them. Now with GPU choices and support.
- [421. Build Executables (Compatible)](421-Build-Executables-Compatible.md) - Build a `mmojo-server` for the base CPU of the build environment platform.
- [422. Build Executables (Performant)](422-Build-Executables-Performant.md) - Build a `mmojo-server` for recent CPUs from the CPU family of the build environment platform.
- [423. Build Executables (Native)](423-Build-Executables-Native.md) - Build an optimized `mmojo-server` for the CPU of the build environment platform.

---
### 400. Build gguf Models (Coming Soon)

---
### [600. Package Mmojo Server](600-Package-Mmojo-Server.md)
Package Mmojo Server for distribution and deployment.

- [611. Package APE (Compatible)](611-Package-APE-Compatible.md) - Package Mmojo Server as an Actual Portable Executable (APE) file, which can run on several operating systems spanning x86_64 and aarch64 (ARM64) arcitectures. The "compatible" APE runs (slowly) on a wide variery of x86_64 and aarch64 (arm64) machines.
- [612. Package APE (Performant)](612-Package-APE-Performant.md) - Package Mmojo Server as an Actual Portable Executable (APE) file, which can run on several operating systems spanning x86_64 and aarch64 (ARM64) arcitectures. The "performant" APE runs faster, but only on later model x86_64 machines and high end aarch64 (arm64) machines like Apple's M*-based Macs.
- [621. Package Executable](621-Package-Executable.md) - Package Mmojo Server as a `.zip` file that can be unzipped into a directory containing the Mmojo Server executable and supporting files.
<!--
- [621. Package SEAS](621-Package-SEAS.md) - Package Mmojo Server as a Self-Extracting Application Support (SEAS) file, that extracts its support files on first run.
-->

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
