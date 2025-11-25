## Disorganized To-Do List

| Added              | Item      |
| :-------------           | :------    |
| 2025&minus;11&minus;25         | For the APE builds, can I remove `-DCOSMOCC=1` from the compiles? CMake warns not used. |
| 2025&minus;11&minus;21         | #defines for default_args and mmojo-server-support filenames in server-mmojo.cpp, so they can be improved, plus replaced easily for Dogpile. |
| 2025&minus;11&minus;23         | First paragraph is wrong about what we're going to build. [400-Build-Mmojo-Server.md](https://github.com/BradHutchings/Mmojo-Server/blob/main/instructions/400-Build-Mmojo-Server.md) |
| 2025&minus;11&minus;21         | Routine update of llama.cpp. Can I just copy loading-mmojo.html to loading.html and forget about changes in server-mmojo.cpp? |
| 2025&minus;11&minus;21         | Pick performance level for Cosmo library and OpenSSL. Or just build a compatible and performant version of each. <-- This would solve things easier. No need to match up prep to builds. Probably doesn't make a huge difference. |
| 2025&minus;11&minus;21         | Is it safe to use the latest Cosmo again? Changes started mid-November and broke the build of the Cosmo library. No. We get 400 responses to our API requests when running the server. Nothing shows up in building before that. Grrrr. |
| 2025&minus;11&minus;23         | Do I still need to rollback the new llama.cpp webui so I can run it non-root-path? I do as of latest commit of llama.cpp I'm letting through. [401. Prepare to Build](https://github.com/BradHutchings/Mmojo-Server/blob/main/instructions/401-Prepare-to-Build.md) |
| 2025&minus;11&minus;23         | Instructions to [205. Create Mmojo Share](205-Create-Mmojo-Share.md). I have a draft of these in the Knowledge Appliance Recipe. |
| 2025&minus;11&minus;23         | `mmojo-server-args` should be a json/yaml file. It's a cool solution inherited from Cosmo and llamafile, but it's also awkward. See the top of the `main()` function in [`server-mmojo.cpp`](https://github.com/BradHutchings/Mmojo-Server/blob/main/files/tools/server/server-mmojo.cpp). It bends my brain every time I look at it. LOL. |


[205-Create-Mmojo-Share.md
](https://github.com/BradHutchings/Mmojo-Server/blob/main/instructions/400-Build-Mmojo-Server.md)


---
### Finished

| Resolved              | Added              | Issue      |
| :-------------           | :------    | :------    |
| 2025&minus;11&minus;25 | 2025&minus;11&minus;21         | Script to pick performance level for APE builds: Levels might be: (1) compatible, (2) performant. If users of this repo want more control, they can fork it and change it. Probably should suggest that. Keep it simple and easy! I split out compatible and performant APE builds. Need to figure out what performant should look like for aarch64 (arm64). |
| 2025&minus;11&minus;25 | 2025&minus;11&minus;21         | Why do mm-work-in-progress and mm-main-branch show a quote error, then when run again, do fine? Goofy, not that anyone else will use them. Seems to be fixed after last PR. |
| 2025&minus;11&minus;25 | 2025&minus;11&minus;23         | Move npm updates to dependencies? Test to make sure it doesn't screw up mmojo or dogpile builds. Works great. [401. Prepare to Build](https://github.com/BradHutchings/Mmojo-Server/blob/main/instructions/401-Prepare-to-Build.md)|
| 2025&minus;11&minus;23 | 2025&minus;11&minus;21         | Figure out which installed dependency is putting up the purple email server screen. Figured out it's `ocaml-core`. Do we need it? Nope. Remove it. https://github.com/BradHutchings/Mmojo-Server/blob/main/instructions/207-Install-Dependencies.md |
| 2025&minus;11&minus;23 | 2025&minus;11&minus;23         | Fix the logic in [`-mm-mount-mmojo-share.sh`](https://github.com/BradHutchings/Mmojo-Server/blob/main/scripts/-mm-mount-mmojo-share.sh). Should try drvfs, then fall back to cifs, or vice versa. This worked! |
| 2025&minus;11&minus;23 | 2025&minus;11&minus;21         | Finish packaging step for Dogpile. |
| 2025&minus;11&minus;23 | 2025&minus;11&minus;21         | If I'm not feeding models to a GPU, do I need to align them in the APE packages? I think "no". If not, no need for mm-zipalign, so get rid of it. See llamafile explanation of why aligning is needed here: https://github.com/mozilla-ai/llamafile/blob/main/docs/technical_details.md#zip-weights-embedding -- It appears that `mmap()` from Cosmo libc isn't handling llama.cpp's call to access a .gguf in the `/zip` path. May or may not fix this another day. Only affects APE. |
| 2025&minus;11&minus;23 | 2025&minus;11&minus;21         | Are `--mlock` and `--no-mmap` needed as parameters when we test builds or package builds? Seems like they should be added by one of our users for better performance / behavior. *Not needed for testing.* Packaging?<br/> It appears that `mmap()` from Cosmo libc isn't handling llama.cpp's call to access a .gguf in the `/zip` path. So `--no-mmap` would be necessary for embedded .ggufs in APE packages. Still investigating. Added an `--mmap` param to override on command-line for future use. |
| 2025&minus;11&minus;22 | 2025&minus;11&minus;21 | Use `mm-choose-model.sh` in [402-Prepare-to-Test.md](https://github.com/BradHutchings/Mmojo-Server/blob/main/instructions/402-Prepare-to-Test.md) |
| 2025&minus;11&minus;21 | 2025&minus;11&minus;21 | Finish instruction file renumbering step for Dogpile. |
