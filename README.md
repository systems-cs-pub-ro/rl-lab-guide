# 🌐 RL Laboratory Tips and Tricks

This repository contains various useful tips and tricks for the RL Laboratory, but also general useful stuff.


## 🧪 Connecting to OpenStack VMs

### ✨ Creating a new VM
  
In order to run OpenStack (Fep) based laboratories, you need to create a new Virtual Machine and work on that.

* 🔒 Step 1: Log in to the [OpenStack Dashboard](https://cloud-controller.grid.pub.ro/dashboard/)
* 📦 Step 2: Create a new instance:
  * Go to the Instances page
  * Click the ***Launch Instance*** button
  * Fill in the instance name
  * On the `Source` page, select `RL 2019`
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

### ✂ Splitting the screen

For a more efficient workflow, use [`byobu`](https://byobu.org/) to split the terminal:

```bash
student@YOUR.VM.IP.ADDRESS$ sudo su # su as root for easier future commands
root@YOUR.VM.IP.ADDRESS$ byobu # enter byobu
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

## 🐧🐳 WSL Setup for Dockers

TODO