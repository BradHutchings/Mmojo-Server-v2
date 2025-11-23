## Disorganized To-Do List

| Added              | Item      |
| :-------------           | :------    |
| 2025&minus;11&minus;21         | Routine update of llama.cpp. Can I just copy loading-mmojo.html to loading.html and forget about changes in server-mmojo.cpp? |
| 2025&minus;11&minus;21         | #defines for default_args and mmojo-server-support filenames in server-mmojo.cpp, so they can be improved, plus replaced easily for Dogpile. |
| 2025&minus;11&minus;21         | Figure out which installed dependency is putting up the purple email server screen. https://github.com/BradHutchings/Mmojo-Server/blob/main/instructions/207-Install-Dependencies.md |
| 2025&minus;11&minus;21         | Why do mm-work-in-progress and mm-main-branch show a quote error, then when run again, do fine? Goofy, not that anyone else will use them. |
| 2025&minus;11&minus;21         | Script to pick performance level for APE builds: Levels might be: (1) compatible, (2) performant. If users of this repo want more control, they can fork it and change it. Probably should suggest that. Keep it simple and easy! |
| 2025&minus;11&minus;21         | Similarly, pick performance for CUDA, VULKAN, and METAL builds.  CUDA and VULKAN could get (1) compatible, (2) performant, (3) native.  METAL would get M1, M2, M3, M4, M5(?) -- AARCH64 only. CPU should just be native. Otherwise, use the performant APE. |
| 2025&minus;11&minus;21         | Pick performance level for Cosmo library and OpenSSL. Or just build a compatible and performant version of each. <-- This would solve things easier. No need to match up prep to builds. |
| 2025&minus;11&minus;21         | Is it safe to use the latest Cosmo again? Changes started mid-November and broke the build of the Cosmo library. |
| 2025&minus;11&minus;23         | Instructions to [205. Create Mmojo Share](205-Create-Mmojo-Share.md). I have a draft of these in the Knowledge Appliance Recipe. |
| 2025&minus;11&minus;23         | `default-args` should be a json/yaml file. It's a cool solution inherited from Cosmo and llamafile, but it's also awkward. See the top of the `main()` function in [`server-mmojo.cpp`](https://github.com/BradHutchings/Mmojo-Server/blob/main/files/tools/server/server-mmojo.cpp). It bends my brain every time I look at it. LOL. |


205-Create-Mmojo-Share.md

---
### Finished

| Resolved              | Added              | Issue      |
| :-------------           | :------    | :------    |
| 2025&minus;11&minus;23 | 2025&minus;11&minus;21         | Finish packaging step for Dogpile. |
| 2025&minus;11&minus;23 | 2025&minus;11&minus;21         | If I'm not feeding models to a GPU, do I need to align them in the APE packages? I think "no". If not, no need for mm-zipalign, so get rid of it. See llamafile explanation of why aligning is needed here: https://github.com/mozilla-ai/llamafile/blob/main/docs/technical_details.md#zip-weights-embedding -- It appears that `mmap()` from Cosmo libc isn't handling llama.cpp's call to access a .gguf in the `/zip` path. May or may not fix this another day. Only affects APE. |
| 2025&minus;11&minus;23 | 2025&minus;11&minus;21         | Are `--mlock` and `--no-mmap` needed as parameters when we test builds or package builds? Seems like they should be added by one of our users for better performance / behavior. *Not needed for testing.* Packaging?<br/> It appears that `mmap()` from Cosmo libc isn't handling llama.cpp's call to access a .gguf in the `/zip` path. So `--no-mmap` would be necessary for embedded .ggufs in APE packages. Still investigating. Added an `--mmap` param to override on command-line for future use. |
| 2025&minus;11&minus;22 | 2025&minus;11&minus;21 | Use `mm-choose-model.sh` in [402-Prepare-to-Test.md](https://github.com/BradHutchings/Mmojo-Server/blob/main/instructions/402-Prepare-to-Test.md) |
| 2025&minus;11&minus;21 | 2025&minus;11&minus;21 | Finish instruction file renumbering step for Dogpile. |
