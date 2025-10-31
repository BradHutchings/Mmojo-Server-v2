## 23. Build llamafile

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step - DO THIS ONCE
In this step, we will clone the llamafile repo and build it. This will give us access to llamafile's `zipalign` tool for packaging `mmojo-server-one`. You don't need to do this every time you build Mmojo Server.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Environment Variables

Let's define some environment variables:
```
cd ~
DOWNLOAD_DIR="21-DOWNLOAD"
BUILD_COSMOPOLITAN_DIR="22-BUILD-cosmopolitan"
BUILD_LLAMAFILE_DIR="23-BUILD-llamafile"
printf "\n**********\n*\n* FINISHED: Environment Variables.\n*\n**********\n\n"
```

_Note that if you copy each code block from the guide and paste it into your terminal, each block ends with a message so you won't lose your place in this guide._

---
### Create Build llamafile Directory
```
mkdir -p ~/$BUILD_LLAMAFILE_DIR
cd ~/$BUILD_LLAMAFILE_DIR
printf "\n**********\n*\n* FINISHED: Create Build Directory.\n*\n**********\n\n"
```

---
### Clone and Build llamafile
We clone and build llamafile so we will have access to its custom `zipalign` tool for packaging. 

```
git clone https://github.com/Mozilla-Ocho/llamafile ~/$BUILD_LLAMAFILE_DIR
cd $BUILD_LLAMAFILE_DIR
make -j8
make install PREFIX=.
printf "\n**********\n*\n* FINISHED: Clone and Build llamafile.\n*\n**********\n\n"
```

Now, `zipalign` exists at `~/23-BUILD-llamafile/bin/zipalign`.


---
### Proceed
- **Next:** [24. Build OpenSSL](24-Build-OpenSSL.md)
- **Previous:** [22. Build Cosmopolitan](22-Build-Cosmopolitan.md)
- **Up:** [20. Gather Build Pieces](20-Gather-Build-Pieces.md)
