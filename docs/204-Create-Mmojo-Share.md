## 204. Create Mmojo Share

Brad Hutchings<br/>
brad@bradhutchings.com

**THIS PAGE NEEDS TO HAVE STEPS INCLIUDED FOR INSTALLING AND CONFIGURING SAMBA. -Brad 2025-11-02**

---
### About the Step
The Mmojo Share is a file share where I keep files for local access and completed builds. It lets me build different items on different build platforms. I use a Ubuntu 24.04 virtual machine to build and test x86_64 and cosmo builds. I use a Raspberry Pi for building and testing ARM64 and Pi specific builds. The Mmojo Share lets me keep .gguf models to test with locally and is where I copy completed and packaged builds. Your Mmojo Share will help you organize your builds as well.

In this step, we will create a Mmojo Share on a device running Linuz. We will install the necessary SMB software, configure `smb.conf`, restart the SMB server, and set it to start automatically at system startup. You can perform this step on another computer on your network if you like.

If you have a Mmojo Share already set up, skip ahead to the next step: [204. Mount Mmojo Share](204-Mount-Mmojo-Share.md).

**Where:** Perform this step on a computer on your network reachable by other build environments on your network.

---
### Create Mmojo Share
Create an SMB share on a computer on your network. It should have a user and password so you can access it from your build systems. Write down the hostname of the computer, and the user that can access the share. You will be prompted for the share's password when you actually mount it.

Details will be here.

### Create Directories on Mmojo Share
Make the directories we'll use.

---
### Proceed
- **Next:** [205. Mount Mmojo Share](205-Mount-Mmojo-Share.md)
- **Previous:** [203. Set Timezone](203-Set-Timezone.md)
- **Up:** [200. Prepare Build Environment](200-Prepare-Build-Environment.md)
