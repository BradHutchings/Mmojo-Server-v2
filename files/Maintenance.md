## Maintenance

These are the instructions for maintaining the files rooted in this directory.

1. Open the original versions in the llama.cpp repo and the patched versions from this repo (twice) in new tabs:
   - llama.cpp - [common/arg.cpp](https://github.com/ggml-org/llama.cpp/blob/master/common/arg.cpp)
     - Mmojo Server - [common/arg-mmojo.cpp](https://github.com/BradHutchings/Mmojo-Server-v2/blob/work-in-progress/patches/common/arg-mmojo.cpp)
     - Mmojo Server - [common/arg-mmojo.cpp](https://github.com/BradHutchings/Mmojo-Server-v2/blob/work-in-progress/patches/common/arg-mmojo.cpp)<br/><br/>
   
   - llama.cpp - [common/common.cpp](https://github.com/ggml-org/llama.cpp/blob/master/common/common.cpp)
     - Mmojo Server - [common/common-mmojo.cpp](https://github.com/BradHutchings/Mmojo-Server-v2/blob/work-in-progress/patches/common/common-mmojo.cpp)
     - Mmojo Server - [common/common-mmojo.cpp](https://github.com/BradHutchings/Mmojo-Server-v2/blob/work-in-progress/patches/common/common-mmojo.cpp)<br/><br/>
   
   - llama.cpp - [common/common.h](https://github.com/ggml-org/llama.cpp/blob/master/common/common.h) -- **This can be easily patched with code.**
     - Mmojo Server - [common/common.h](https://github.com/BradHutchings/Mmojo-Server-v2/blob/work-in-progress/patches/common/common.h)
     - Mmojo Server - [common/common.h](https://github.com/BradHutchings/Mmojo-Server-v2/blob/work-in-progress/patches/common/common.h)<br/><br/>
   
   - llama.cpp - [tools/server/server.cpp](https://github.com/ggml-org/llama.cpp/blob/master/tools/server/server.cpp)
     - Mmojo Server - [tools/server/server-mmojo.cpp](https://github.com/BradHutchings/Mmojo-Server-v2/blob/work-in-progress/patches/tools/server/server-mmojo.cpp)
     - Mmojo Server - [tools/server/server-mmojo.cpp](https://github.com/BradHutchings/Mmojo-Server-v2/blob/work-in-progress/patches/tools/server/server-mmojo.cpp)

2. Compare last modified dates of the originals and patched files. Discard tab triplets where the original is older.
   <img width="304" height="82" alt="image" src="https://github.com/user-attachments/assets/f8814cc1-e244-4ac5-a4d5-e61fa9f339ad" />

3. Edit the middle tab of tab triplet. Copy left tab file contents. Paste into middle tab edit area.

4. Search for `mmojo-server START` in right tab of tablet triplet. Repeatedly copy those blocks from right tab and paste into middle tab.

5. Commit changes to middle tab

6. Edit the script that clones llama.cpp and change the rollback point. More details needed here.

   <img width="205" height="180" alt="image" src="https://github.com/user-attachments/assets/9beadab3-9b4f-4435-9c0b-41edb728a590" />
