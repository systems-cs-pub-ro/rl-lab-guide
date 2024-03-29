# 🌐 RL Laboratory Tips and Tricks

This repository contains various useful tips and tricks for the RL Laboratory, but also general useful stuff.

## 🧪 Connecting to OpenStack VMs

<details>
<summary>
🔽 Expand instructions
</summary>

### ✨ Creating a new VM
  
In order to run OpenStack (Fep) based laboratories, you need to create a new Virtual Machine and work on that.

* 🔒 Step 1: Log in to the [OpenStack Dashboard](https://cloud-controller.grid.pub.ro/dashboard/)
* 📦 Step 2: Create a new instance:
  * Go to the Instances page
  * Click the ***Launch Instance*** button
  * Fill in the instance name
  * On the `Source` page, select `RL 2018`
  * On the `Flavor` page, select `m1.small`
  * On the `Key Pair` page, select your assigned key pair
  * Hit `Launch Instance`
* ⌛ Step 3: Wait
  * Wait until the IP address of the instance appears in the list

### 🚚 Connecting to the machine

To connect to the machine, follow the next steps:

* 👨‍💻 `ssh` into `fep.grid.cs.pub.ro`:

```bash
ssh cscurs.user@fep.grid.cs.pub.ro
# Enter your cs.curs password
```
* 👨‍💻 `ssh` into your VM:
```bash
ssh student@YOUR.VM.IP.ADDRESS
```

✨ Now you're ready to start the laboratory. ✨ 

### 🔧 Lab setup script

Before every laboratory, you have to run a certain `prepare script`. Look into the laboratory description for the exact commands.

It's going to look something like this:

```
root@YOUR.VM.IP.ADDRESS:~# wget https://raw.github.com/RL-UPB/rl-lab-prepare/master/rl-lab-X-prepare
root@YOUR.VM.IP.ADDRESS:~# chmod +x rl-lab-X-prepare
root@YOUR.VM.IP.ADDRESS:~# ./rl-lab-X-prepare
```

> ⚠ Remember, you have to run the above commands ***as root** on your VM.

### ✂ Splitting the screen

For a more efficient workflow, use [`byobu`](https://byobu.org/) to split the terminal:

```
student@YOUR.VM.IP.ADDRESS:~$ sudo su // su as root for easier future commands
root@YOUR.VM.IP.ADDRESS:~# byobu // enter byobu
```

Now that you're in `byobu`, run the following key combinations to split your terminal:

* <kbd>Ctrl</kbd>+<kbd>F2</kbd> - Split terminal horizontally ↔
* <kbd>Shift</kbd>+<kbd>F2</kbd> - Split terminal vertically ↕
* <kbd>Ctrl</kbd>+<kbd>F3</kbd> and <kbd>Ctrl</kbd>+<kbd>F4</kbd> (or <kbd>Ctrl</kbd> + arrow keys) - Switch between terminals

For a quick start, run the following key combinations:

<kbd>Ctrl</kbd>+<kbd>F2</kbd>

<kbd>Shift</kbd>+<kbd>F2</kbd>

<kbd>Shift</kbd>+<kbd>F2</kbd>

<kbd>Shift</kbd>+<kbd>F2</kbd>

This will split your screen like so:

```
---------------------------------
              |
              |      
              |
              |------------------
              |      
              |------------------
              |      
---------------------------------
```

Which you can set up to look like this:

```
---------------------------------
              |
              |      🔴 red
              |
    🕴 root    |------------------
              |      🟢 green
              |------------------
              |      🔵 blue
---------------------------------
```
</details>

## 🐧🐳 WSL Setup for Dockers

If you are using Windows as your primary operating system, you can use the Windows Subsystem for Linux (or WSL) to run Linux applications. In this way, you do not need to dual-boot with Linux anymore.

#### 🚚 Installing WSL

In order to install WSL, you can follow the steps outlined [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10). The gist of it is this:

1. 🌟 Right-click the Start Menu and select Windows PowerShell (Admin)
    * If you do not have this option in the start menu, search for PowerShell, right click its icon and select `Run as Administrator`
2. 📋 In the PowerShell window, paste the following command:

```PowerShell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

3. 🔁 Restart your computer. After this, you now have WSL installed, but you also need to install a Linux distribution.
4. 🐧 Install a Linux distribution from the Microsoft Store. A good starting point is the [Ubuntu](https://www.microsoft.com/store/apps/9N9TNGVNDL3Q) distribution. Select Get on the page that opens.
5. 🚀 Launch the `Ubuntu` shortcut and follow the steps to finish configuring WSL.

> 💡 For a better experience you can also [install the Windows Terminal Preview from here](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701).

#### 🐳 Installing Docker

Currently you cannot install Docker directly into WSL, so we need to install it into Windows, and then control it from Ubuntu. The gist of it looks something like this:

```
    ⏹ Windows                     🐧 WSL
 ------------------           -------------------
 🐳 Docker Service  ◀----▶     🐋 Docker Client
```

##### 🐳 Installing the Windows Docker Service

> ## ⚠ A note regarding VirtualBox / VMWare ⚠
> 
> Docker for Windows depends on a system called [HyperV](https://en.wikipedia.org/wiki/Hyper-V). This is a Virtual Machine system similar to VirtualBox or VMWare. Due to this reason, they cannot be installed and running at the same time.
> 
> If you have VirtualBox or VMWare installed, remove them before continuing. You can learn how to [migrate VirtualBox VMs to HyperV here.](https://www.groovypost.com/howto/migrate-virtual-box-vms-windows-10-hyper-v/)


1. 📩 [Download and run the installer from here.](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe)

2. 🚪 Allow the Docker service to be accessed from `localhost`

    Access the Docker for Windows control panel. Open its settings and look for an option called:

    > Expose daemon on tcp://localhost:2375 without TLS

    This will allow our WSL client to connect to the Docker service.

3. 🐋 Install the Docker client in WSL

    Run the following commands to install the required packages:

    ```bash
    wget https://raw.githubusercontent.com/systems-cs-pub-ro/rl-lab-guide/master/scripts/wslDockerInstall.sh
    chmod +x wslDockerInstall.sh
    ./wslDockerInstall.sh
    ```


<details>
<summary> 🏠 If you are using Windows 10 Home Edition 🏠</summary>

Windows 10 Home Edition *does not support HyperV*. It instead uses a VirtualBox machine to set up the Docker service. Due to this reason, you will **not** use WSL, but instead run your code directly on the provided VirtualBox VM.

The downside of this is that you are very limited in what you can do with the VM. For example, sharing files between the VM and your machine is very cumbersome.

If you have this version of Windows, you have to run these steps instead:

1. 📩 Download and install [Docker Toolbox](https://github.com/docker/toolbox/releases/download/v19.03.1/DockerToolbox-19.03.1.exe)

2. 🚪 Allow the Docker service to be accessed from `localhost`

    Open the `Docker Quickstart Terminal` and run the following command:

    ```
    docker-machine ssh
    ```

3. ✅ Done. You can now run docker commands here.

</details>

### 🐧 Linux

If you're running Linux, run the following commands:

```bash
wget https://raw.githubusercontent.com/systems-cs-pub-ro/rl-lab-guide/master/scripts/linuxDockerInstall.sh
chmod +x linuxDockerInstall.sh
./linuxDockerInstall.sh
```

## 💡 WSL and Windows Terminal Tips

This list is a work in progress collection of various useful tips and tricks that will help you make the most of the Windows Subsystem for Linux and Windows Terminal.

* 📁 Accessing WSL files from Windows

  Usually the files in your WSL instance are completely separated from the ones in your Windows machine. In order to access your files, you can open an `explorer.exe` window from anywhere within WSL:

  ```
  cd ~
  explorer.exe .
  ```

* ✂ Splitting the terminal in Windows Terminal

  Starting with version `0.7` of the Windows Terminal, you can split the terminal window just like in `byobu`. The shortcuts for this are:

  * ↔ Horizontal split - <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>+</kbd>
  * ↕ Vertical split - <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>-</kbd>

