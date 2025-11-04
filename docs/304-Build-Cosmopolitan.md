## 304. Build Cosmopolitan

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step - DO THIS ONCE
In this step, we will clone the Cosmopolitan repo, fix known problems, and build it. You don't need to do this every time you build Mmojo Server.

**Where:** Perform this step in both your x86_64 and your aarch64 (arm64) build environments.

---
### Environment Variables

Let's define some environment variables:
```
cd ~
DOWNLOAD_DIR="21-DOWNLOAD"
BUILD_COSMOPOLITAN_DIR="22-BUILD-cosmopolitan"
printf "\n**********\n*\n* FINISHED: Environment Variables.\n*\n**********\n\n"
```

_Note that if you copy each code block from the guide and paste it into your terminal, each block ends with a message so you won't lose your place in this guide._

---
### Create Build Cosmopolitan Directory
```
mkdir -p ~/$BUILD_COSMOPOLITAN_DIR
cd ~/$BUILD_COSMOPOLITAN_DIR
printf "\n**********\n*\n* FINISHED: Create Build Directory.\n*\n**********\n\n"
```

---
### Clone Cosmopolitan Repo, Build Locally
Clone Cosmopolitan repo into a `~\22-BUILD-cosmopolitan` directory, fix bugs, then build Cosmopolitan. Build this once, and leave the `~\22-BUILD-cosmopolitan` directory between builds.
```
git clone https://github.com/jart/cosmopolitan.git ~/$BUILD_COSMOPOLITAN_DIR
cd ~/$BUILD_COSMOPOLITAN_DIR
# Edit the memchr_sse() function to check params.
sed -i '39i \  if ((s == NULL) || (n == 0)) return 0;' libc/intrin/memchr.c
tool/cosmocc/package.sh
printf "\n**********\n*\n* FINISHED: Clone Cosmopolitan Repo, Build Locally.\n*\n**********\n\n"
```


---
### Proceed
- **Next:** [305. Build llamafile](305-Build-llamafile.md)
- **Previous:** [303. Copy Models](303-Copy-Models.md)
- **Up:** [300. Gather Build Pieces](300-Gather-Build-Pieces.md)
