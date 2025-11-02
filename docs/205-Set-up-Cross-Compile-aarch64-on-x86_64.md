## 205. Set up Cross Compile aarch64 on x86_64

Brad Hutchings<br/>
brad@bradhutchings.com

---
### About this Step
Cross-compiling llama.cpp does not work very well right now. The llama.cpp CMake build system is meant to discover the capabilities of the host machine and build for that. In particular, I run into problems with OpenSSL that need to be patched for cosmocc builds to link in compatible static libraries.

I've had some limited success building for Raspberry Pi (arm64) from x86_64 Ubuntu, but not for optimized builds. For example, a private summary benchmark I have, running on a Pi 5, takes about 45 minutes with the cosmocc build, 18 minutes with a cross-compiled build, and 7 minutes with an optimized build built on the Pi 5. I'm working towards getting optimized cross-compiled builds, but it's a long term goal.

**Where:** Perform this step in your x86_64 build environment.

---
### Environment Variables
Run this script to set environment variables.
```
cd $HOME
export MMOJO_SERVER_DIR="$HOME/201-mmojo-server"
export MMOJO_SERVER_SCRIPTS="$MMOJO_SERVER_DIR/scripts"
```

---
### Set up Cross Compile aarch64 (arm64) on x86_64
ARM has a few names for various versions and purposes of developer tools. `aarch64` means the same thing in some contexts as `arm64` does in others.

Do this if you're running on x86_64.

View the script in a new tab: <a href="../scripts/205-Set-up-Cross-Compile-aarch64-on-x86_64.sh" target="_blank">205-Set-up-Cross-Compile-aarch64-on-x86_64.sh</a>

```
bash $MMOJO_SERVER_SCRIPTS/205-Set-up-Cross-Compile-aarch64-on-x86_64.sh
```


Old copy pasta:
```
sudo dpkg --add-architecture arm64
sudo cat << EOF > ubuntu-arm64.sources
Types: deb
URIs: http://ports.ubuntu.com/ubuntu-ports/
Suites: noble noble-updates noble-security
Components: main restricted universe multiverse
Architectures: arm64
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
EOF
sudo mv ubuntu-arm64.sources /etc/apt/sources.list.d/ubuntu-arm64.sources
sudo apt update
sudo apt install -y libssl-dev:arm64
sudo apt install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu binutils-aarch64-linux-gnu

printf "\n**********\n*\n* FINISHED: Set up Cross Compile aarch64 (arm64) on x86_64.\n*\n**********\n\n"
```

#### Verify that libssl.a and libcrypto.a are Installed for Both Architectures
Find where the files are under `/usr/lib`:
```
find /usr/lib -name "libssl.a"
find /usr/lib -name "libcrypto.a"
printf "\n**********\n*\n* FINISHED: Verify that libssl.a and libcrypto.a are Installed.\n*\n**********\n\n"
```

The output should look like this:
```
/usr/lib/x86_64-linux-gnu/libssl.a
/usr/lib/aarch64-linux-gnu/libssl.a
/usr/lib/x86_64-linux-gnu/libcrypto.a
/usr/lib/aarch64-linux-gnu/libcrypto.a
```

I hope to be able to use these to replace the lengthy openssl build with cosmocc at some point. They aren't currently compatible with Cosmopolitan because `_FORTIFY_SOURCE` was used to build these static libraries.

---
### Proceed
- **Next:** [206. Set up Cross Compile - x86_64 on aarch64](206-Set-up-Cross-Compile-x86_64-on-aarch64.md)
- **Previous:** [204. Install Dependencies](204-Install-Dependencies.md)
- **Up:** [200. Prepare Build Environment](200-Prepare-Build-Environment.md)
