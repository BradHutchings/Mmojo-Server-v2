# Mmojo Server - version 2

Welcome to Mmojo Server version 2! This project makes it easy to build and package the LLM server and other software from llama.cpp with some carefully selected extensions and enhancements. Highlights:
- Build and package Actual Portable Executable (APE) files that run on Linux, Windows, macOS across x86_64 and aarch64 (ARM64) architectures.
  - I am inspired by the original llamafile project.
  - APE files can contain an LLM, user interface, certificates, and other support files.
  - Download and run the same executable file on x86_64 Linux and an ARM Raspberry Pi.
- Coordinate builds across CPU and OS platforms with a file share on your network.
- Mmojo Complete completion-style user interface can be the default UI, with chat-style UI as an end-user option.
- Mmojo Server version 2 is no longer a Github fork of llama.cpp. Instead, it incorporates a locally cloned llama.cpp repository into its build sequence.
- My philosophy is that end-users can easily get started with the APE build, then upgrade to an optimized CPU/GPU build for their computer. Developers building Mmojo Server should expect a similar experience.
- I want Mmojo Server to be the easiest way for developers to build llama.cpp and to foster greater and wider understanding of how llama.cpp works.
- I use Mmojo Server for my own consulting and commercial offerings. There is no fluff in this project driven by hypothetical use cases, surveys, or discussion board warriors. I do not solicit or accept pull requests from strangers. You can depend on Mmojo Server to be maintained and remain relevant.
 
Mmojo Server version 2 is currently a rough draft, but more useful in practice than version 1. For now, I have archived version 1 in the Mmojo-Server-v1 repo. 

Get started now by diving into the [Mmojo Server documentation](doc/001-Table-of-Contents).

-Brad<br/>
--<br/>
Brad Hutchings<br/>
brad@bradhutchings.com

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
