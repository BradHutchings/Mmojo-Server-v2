## 101. Project Goals
### History
Mmojo Server was inspired by Mozilla Foundation's llamafile, which built llama.cpp as an Actual Portable Executable (APE) file. This file could run on x86 and ARM, under Linux, macOS, Windows, FreeBSD, and a few other less notable operating systems. The APE file contained the LLM, often gigabytes in size. It was download once, run anywhere. I shipped llamafile APE files that also included my completion-style user interface and incorporated SSL certificates. I encouraged my consulting clients to use these on their PCs rather than using cloud LLMs. Even though they aren't very technical people, they were mostly able to make llamafiles work because they didn't have to do too much. Comparatively, systems like Ollama &mdash; built for non-technical people with an extensive UI &mdash; were intimidating!

Unfortunately, Mozilla Foundation stopped actively supporting llamafile around the fall of 2024. This meant that support for new models rolled out in llama.cpp was not incorporated into llamafile. This turned out to be the greatest weakness of llamafile. If nobody kept it up to date with the additions to and changes in llama.cpp, it just wasn't that interesting. This is the main organizing principle for Mmojo Server. It has to offer the run everywhere feature of llamafile, but has to be maintainable, especially the llama.cpp part.

*Llamafile was recently adopted by Mozilla Foundation subsidiary (?) Mozilla.ai. There is a new promise of keeping it up to date. I've discussed both the Mmojo Server and llamafile project with a member of their team extensively, and didn't leave the discussion thinking they were fixing the underlying problem of focus. YMMV.*

---
### Project Goals
The goal of the Mmojo Server project is to provide LLM server software that is easy to install on any supported system, then easy enough to update to a more performant version tuned to users' specific hardware and operating system. Mmojo Server will do the first part with APE files. It will do the second part by not customizing llama.cpp in unmaintainable ways and keeping the llama.cpp part up-to-date at least weekly. This will let us gain from everything llama.cpp is doing for reach and performance.

There are some lessons from llamafile and APE packaging I can apply to the platform-specific build. We can package supporting files &mdash; like configuration, .gguf models, user interface, and certificates &mdash; in subdirectories adjacent to our executables, or perhaps in the executables themselves. Packaging for easy end-user installation is important.

I want to promote my Mmojo Complete completion-style user interface as a better way to use LLMs than the chat illusion. People do not need to pretend they are having a conversation to get good information from an LLM. Meanwhile, the chat illusion can have serious downsides for people who get hooked into it.

For developers, especially in the agent space, the OpenAI compatible API that llama.cpp gives us will save them money and support hassle. It will eliminate the drift problem. It has the potential to preserve end-user privacy and dignity as well.

I am not interested in squeezing out every ounce of performance out of particular CPUs or GPUs. The llama.cpp team has that covered. One funny thing that made llamafile more complicated than it needed to be was its focus on CPU inference optimization. It's funny because having to run on a wide range of x86 and ARM chips already took many effective CPU specific compiler optimizations off the table. And while the out-of-the-box Metal support on macOS was impressive, it made deploying llamafile for the first time a bit cumbersome for macOS users who weren't developers.

Most importantly to me, I created and maintain Mmojo Server to power my Mmojo Knowledge Appliance. Every feature in Mmojo Server is included because it makes the appliance better. There will be no unmaintainable fluff. My ability and willingness to say "No" will keep Mmojo Server a more usable and useful platform for you.

---
### Proceed
- **Next:** [102. Project Features](102-Project-Features.md)
- **Previous:** This is the first step in this section.
- **Up:** [100. Overview](100-Overview.md)

---
[MIT License](/LICENSE)<br/>
Copyright (c) 2025 [Brad Hutchings](mailto:brad@bradhutchings.com)<br/>
[https://github.com/BradHutchings/Mmojo-Server](https://github.com/BradHutchings/Mmojo-Server)
