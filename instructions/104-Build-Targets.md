## 104. Build Targets
### Why Build Targets, Plural?
The obvious question is why there need to be build targets if we have Actually Portable Executable (APE) files that run anywhere. The answer is performance. APE files gives us simple deployment at the cost of performance. Because the builds inside them have to be statically linked, we can't, for example, dynamically link against GPU drivers. The original llamafile was able to provide Metal support on Apple M* silicon, but it had to do dynamic compilation on the user's Mac to provide that support. This made installation and maintenance of llamafiles precarious for non-technical users and occasional developers running on Macs. Clever approach, not that workable in practice.

---
### Benchmarks
I have a home-grown benchmark for evaluating my Mmojo Server builds. It is using Mmojo Complete to summarize a particular one-hour podcast transcript. The transcript comes from YouTube and has been massaged to remove timestamps and other formatting. I time how long the evaluating step takes.

Here are the results of running the benchmark in a Windows Subsystem for Linux (WSL) instance on my 12-gen i7-12700H Dell Laptop with 64 GB RAM and NVIDIA GeForce RTX 3050 Laptop GPU (4 GB GPU RAM). I run an APE, an unoptimized "Debug" buid, an optimized CPU Build, and an optimized CPU with CUDA build. `mmojo-server` is invoked with the default number of available threads, which are half the CPU threads available. The input has 17,272 tokens. I'm using Google Gemma 1B Instruct v3 (`Google-Gemma-1B-Instruct-v3-q8_0.gguf`), which you'll typically use to test builds.

| Build              | Evaulation Time | Notes                                                 |
| :-------           | :------         | -------:                                              |
| Unoptimized Debug  | 5:25            | CPU can do a lot of work.                             |
| APE                | XX:XX           | Static libraries and generic optimized compile.       |
| Optimized CPU      | XX:XX           | Compiler can save a lot of work for a particular CPU. |
| CUDA               | XX:XX           | This is what user eventually want.                    |

---
### Build Targets
Current build targets itemized here.

---
### Future Build Targets
Future build targets itemized here.

---
### Proceed
- **Next:** [105. Packaging for Deployment](105-Packaging-for-Deployment.md) 
- **Previous:** [103. Build Environment](103-Build-Environment.md)
- **Up:** [100. Overview](100-Overview.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
