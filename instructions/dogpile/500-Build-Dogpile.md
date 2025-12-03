## 500. Build Dogpile
### About Dogpile
**Dogpile** is an example of a branded developer experience. You can build Mmojo Server without the Mmojo Server customizations like Mmojo Complete and SSL certificates, and package it in an APE file of a different name. I'm working on some very minor customization details like the process name reported to the operating system and the name of the support directory. If you'd like to become a sponsor of Mmojo Server, this is a zero-work on your part branding opportunity.

If you're wondering about the name...
<img width="778" height="221" alt="image" src="https://github.com/user-attachments/assets/4c433696-eb88-4a65-a036-f6eac2fe7508" />

---
### About this Section
We're ready to build `dogpile` executables. First, we'll build a native version for the build environment platfrom that can be used to test features and changes. Then, we'll build an Actually Portable Executable (APE) with Cosmopolitan that will run anywhere.

---
### Build Dogpile
Here are the things you need to do:
- [501. Prepare to Build](501-Prepare-to-Build.md) - Clone llama.cpp repo, fix some things, and copy some things.
- [502. Prepare to Test](502-Prepare-to-Test.md) - Set some environment variables to customize test runs.
- [503. Build Debug](503-Build-Debug.md) - Build an unoptimized `dogpile` for the CPU of the build environment platformm that can be used to test features and changes.
- [510. Build APEs](510-Build-APEs.md) - Explains APEs and how to build them.
- [511. Build APEs (Compatible)](511-Build-APEs-Compatible.md) - Build `dogpile-ape` as an Actually Portable Executable (APE) with Cosmopolitan. This build is widely compatible with x86_64 and aarch64 (arm64) systems, but not very performant.
- [512. Build APEs (Performant)](512-Build-APEs-Performant.md) - Build `dogpile-ape` as an Actually Portable Executable (APE) with Cosmopolitan. This build is compatible with recent x86_64 and aarch64 (arm64) systems and more performant.

**Get Started:** [501. Prepare to Build](501-Prepare-to-Build.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
