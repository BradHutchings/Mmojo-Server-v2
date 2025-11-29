## Mmojo Runner (dev)
### About Mmojo Runner
What is this? It's going to be a polyglot format that can handle options for a particular platform and CPU. It stems from wanting one `mmojo-server` that contain both compatible and performant versions of the app for multiple platform and CPU family combinations. Or contain versions that can use your GPU.

---
### How Does it Work?
There are a collection of scripts prefixed with `mr-` (for "Mmojo Runner") in your `$HOME/mm-scripts` directory. You use them to create an archive, add files to an archive, then attach the archive to a preamble script to yield a polyglot, i.e. an app that can run on multiple platforms and architectures.

I'm focused on Linux and macOS, x86_64 and aarch64 right now. Windows users are best served by running one of these in a Windows Subsystem for Linux (WSL) instance. This will not require installation of dev tools on macOS to run one of these. It will allow the actual binaries to dynamically link against more performant and security hardened libraries on their systems rather than force them to static link for cross-operating-system functionality.

Perhaps the coolest feature should be (hopefully) that you as a developer can build one of these for one platform CPU combination, and take the package a la carte to other build platforms to add them to the archive. No need to build everything first, gather in one place, then assemble.

-Brad

---
### Bootstrapping
Snippets I'm using while building this thing out.

Make a new archive:
```
mr-new-runner.sh test-archive mmojo-server mmojo-server-support
```

Add a .gguf model to an existing archive:
```
mr-add-model.sh test-archive 300-MODELS/Google-Gemma-1B-Instruct-v3-q8_0.gguf
```
