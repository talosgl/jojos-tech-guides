# Get Set Up to Install and Run Python Scripts on Your Computer

## Overview
This is a quick and easy guide to help you get set up to run Python scripts on your computer. We'll cover the steps necessary for Windows 11, macOS, and Linux (via Ubuntu).

### Audience
Tech-savvy folks who:
- found a Python script online and want to run it
- don't have a Python development environment set up yet
- are comfortable with basic computer tasks
- want to get something working quickly (no coding required)

We're going to be using the terminal (also called the command line, console, or shell), but it's completely fine if you're not used to doing that; you don't need existing experience. (Except if you're on Linux; sorry, some existing terminal experience will be useful for y'all.)

### Goal
Get from "I found this useful .py script" to "it's running on my computer" with minimal fuss and a sustainable setup for future tools.

### Notes
1. If you're viewing this on the web via GitHub's "Code" preview, you can open up an Outline using the outline icon (usually in the top-right).
	-  <img src="imgs/python-script-setup/Pasted image 20250903160236.png" alt="gh outline note" width="100">
2. As an added bonus, you can take what you set up & learn here and do your own Python script development in future, but this guide only covers installing and running other folks' scripts.

---

## Part 1: Steps to do One-Time per Computer
You should only need to do the steps in this section should one time on your computer (or per user account).

#### Optional Sidequest: Check and see if Python's already installed 
If you're already comfortable in the terminal, you can check and see if you've previously installed python before with:
```bash
~$ python --version # Windows
~$ python3 --version # Mac & Linux
```
If you get a version number back, make sure it's above 3.10.

### 1. Install Python
If you are on Mac or Windows, go to https://www.python.org/downloads/ and download and install the newest version of Python for your platform.

#### Windows:
<img src="imgs/python-script-setup/Pasted image 20250902130347.png" alt="Python download page for Windows" width="300">

Use the default installer settings, along with checking the box for **Add python.exe to PATH**:

<img src="imgs/python-script-setup/Pasted image 20250903132122.png" width="400">

#### Mac:
<img src="imgs/python-script-setup/Pasted image 20250903144155.png" alt="macOS installer button" width="300"> <img src="imgs/python-script-setup/Pasted image 20250903144140.png" alt="macOS package" width ="300">

1. Step through the installation. 
2. On the very last screen you may see this message about running some special post-install commands. (I'll be honest, I don't know what this means, but I'll walk you through the steps to do what it's saying so we don't hit issues with pip later.)
	- <img src="imgs/python-script-setup/Pasted image 20250903144500.png" alt="macOS installer message about SSL" width="400">
3. Go to the finder location for Python 3.13; the installer should have popped it up, and double-click the "**Install Certificates.command"** file:
	-  <img src="imgs/python-script-setup/Pasted image 20250903144741.png" width="600">
4. A terminal window should pop up and let you know it's done its thing: 
	- <img src="imgs/python-script-setup/Pasted image 20250903144809.png" width="400">

#### Linux
On most Linux distros, Python will already be installed. You can check in the standard terminal with the command:
```bash
$ python3 --version
	Python 3.10.12 # hopefully you get something like this back
```

If for some reason it's not already installed, the easiest way to install Python will be with your distro's native package manager. For this guide we're using Ubuntu, so that'd be apt (Advanced Package Tool). The commands then would be:
```bash
sudo apt update # get everything else up-to-date first
sudo apt install python3
```

#### What is this, and why am I installing it?
This installation includes the essential program to read and execute Python code, the Python Core Interpreter. That translates Python code into instructions your computer can understand and act on. The installation also includes other key components we'll need to run a Python script locally, like the Standard Library, the Package Manager (pip), and Runtime Environment system files and configurations that allow Python to run on each operating system.

---

### 2. Install VS Code
Go to https://code.visualstudio.com/download and download and install the newest version of VS Code for your platform.

<img src="imgs/python-script-setup/Pasted image 20250902131142.png" alt="VS Code download page" width="500" />

Here are more detailed guides per OS:
- [Install VS Code on Windows](https://code.visualstudio.com/docs/setup/windows#_install-vs-code-on-windows) - You can stop when you reach the heading "User setup versus system setup." (The default installer will do user setup.)
- [Install VS Code on macOS](https://code.visualstudio.com/docs/setup/mac#_install-vs-code-on-macos) - You can stop when you reach the heading "Launch VS Code from the command line" (You don't need to do that.)
- [Install VS Code on Linux](https://code.visualstudio.com/docs/setup/linux#_install-vs-code-on-linux) - You can stop when you reach the heading "Configure VS Code as the default text editor" (You don't need to do that, unless you want to.)

On Windows, the default installer settings should be fine, but you can enable the context menu options as well to help future-you out:
<img src="imgs/python-script-setup/Pasted image 20250903132646.png" width="400">

#### What is this, and why am I installing it?
VS Code is a free and open-source "IDE" or Integrated Development Environment. We're installing it so that we have an easy graphical user interface (GUI) with which we can inspect and run Python scripts safely in their own isolated "virtual environments." (We'll set up virtual environments shortly to keep each script's requirements separate.)

Note: You could accomplish the same things using just the terminal, but VS Code makes the process more visual and user-friendly.

---

### 3. Launch VS Code & Take a moment to look at the UI
Now let's launch VS Code. It may auto-launch after it finishes installing. If not, here're the standard ways:

- Windows: Launch VS Code from **Start** > **Search** > type in `vs code` > Click **Open**
	- <img src="imgs/python-script-setup/Pasted image 20250902142931.png" alt="Launching VS Code from Windows Start menu" width="500">
- Mac: Launch from **Launchpad** > **Visual Studio Code**, or press `Cmd+Spacebar` and type "Visual Studio Code" to find it
	- <img src="imgs/python-script-setup/Screenshot 2025-09-03 at 2.20.46 PM.png" alt="Launching VS Code from macOS Launchpad" width="300">
	- <img src="imgs/python-script-setup/Screenshot 2025-09-03 at 2.25.51 PM.png" width="400">
	- (If you followed the VS Code guide to install it on macOS, recall this step:
		- "Drag `Visual Studio Code.app` to the **Applications** folder, making it available in the macOS Launchpad.")
- Linux:
	- In Ubuntu, launch VS Code from the Activities interface: see [Start applications](https://help.ubuntu.com/stable/ubuntu-help/shell-apps-open.html.en).

If it's your first time launching VS Code, you may get a tutorial window. If you like, you can step through it, but we're going to skip it. Once you're ready to move on in this guide, just close that tab with the X:

<img src="imgs/python-script-setup/Pasted image 20250903132904.png" width="250">


Let's take a quick tour of the UI and what I'll be calling different parts of it throughout the rest of the guide. Don't worry about if your UI doesn't match the screenshots at the moment (it probably doesn't), and don't worry about understanding the descriptions right now; they're there for your future reference.

1. **Explorer** pane (file tree) - where we'll see the folder structure per-script
2. **Editor** area - where files open
3. **Integrated Terminal** - where we'll run commands
4. **Run and Debug** panel - for the advanced script launcher
5. **Extensions** - where you install additional plugins for added functionality

<img src="imgs/python-script-setup/Pasted image 20250902160012.png" alt="VS Code UI overview showing main panels" width="600">

<img src="imgs/python-script-setup/Pasted image 20250902160154.png" alt="VS Code UI with terminal and debug panels highlighted" width="300">

<img src="imgs/python-script-setup/Pasted image 20250903134955.png" width="300">

---

### 4. Install VS Code's Python Extension
1. Click the Extensions icon in the left sidebar (looks like four squares)
	- <img src="imgs/python-script-setup/Pasted image 20250903133001.png" width="200">
2. Search for "Python" and install the one by Microsoft
	-  <img src="imgs/python-script-setup/Pasted image 20250903133052.png" width="600">
3. Once that's finished, you can minimize VS Code for now.

---

### 5. Get Folder Structure Ready
Now that we've got the necessary software installed, let's create a specific folder for housing Python scripts we want to install. 

Think of this as a folder similar to `c:\Program Files\` in Windows, `/Applications/` in Mac, or `/usr/local/bin/` in Linux, except we're setting this one up specifically to store Python scripts and what we need to run them.

You can create this new folder wherever you wish; but here's my suggested spot for where to create it:
- In Windows: `C:\py-scripts\`
- Mac/Linux: `~/py-scripts/`

Create this folder using your operating system's file manager: Navigate to the parent location (c:/, or your home ~/) folder, right-click, and select "New Folder" in Windows/Linux; or, in Mac's Finder, use `Cmd+Shift+N`.

Windows:
1. <img src="imgs/python-script-setup/Pasted image 20250902131953.png" alt="Windows File Explorer showing C: drive" width="600">
2. <img src="imgs/python-script-setup/Pasted image 20250902141805.png" alt="Creating new folder in Windows" width="600">



Mac:
1. <img src="imgs/python-script-setup/Pasted image 20250903143215.png" width="300">
2. <img src="imgs/python-script-setup/Pasted image 20250903143352.png" width="100">


Linux:
- <img src="imgs/python-script-setup/Screenshot from 2025-09-03 16-51-06.png" width="300">



---

## Part 2: Steps to do per new Python Script
The steps in this section will need to be repeated for each different Python script you want to install and run. We'll go into a little more depth here so you get an idea of why you are doing what you're doing; my hope is that'll help you re-apply them later to future scripts!

### 1. Create a Folder for the Python script we'll install
To get set up to install our first Python script, let's make a new folder inside the one we just made. For our example we're going to install `yt-dlp`, so let's create a folder with that name.

1. Navigate to the py-scripts folder you created earlier.
	- Windows: `C:\py-scripts\`
	- Mac/Linux: `~/py-scripts/`
1. Create a new subfolder for this specific script. Right-click in the empty space and select "New Folder" (Windows/Linux) or use `Cmd+Shift+N` (Mac).
2. Name it after the script you want to install - for our example, use `yt-dlp`
3. Verify you've got the right folder structure:
	- Windows: `C:\py-scripts\yt-dlp\`
		- <img src="imgs/python-script-setup/Pasted image 20250902141839.png" alt="Creating yt-dlp folder" width="400">
	- Mac/Linux: `~/py-scripts/yt-dlp/`
		- <img src="imgs/python-script-setup/Pasted image 20250903143448.png" width="200">
		- <img src="imgs/python-script-setup/Screenshot from 2025-09-03 16-51-35.png" width="400">

This folder will contain everything related to this one script.

---

### 2. Open new script folder in VS Code
We next want to open this folder as a "workspace" in VS Code.

1. Launch VS Code on your computer again (or maximize it from the tray).
2. From inside VS Code, go to File > Open Folder, then navigate to the folder we just created to open it:
	- <img src="imgs/python-script-setup/Pasted image 20250902143052.png" alt="VS Code File menu Open Folder option" width="500">
	- <img src="imgs/python-script-setup/Pasted image 20250902143143.png" alt="VS Code folder selection dialog" width="500">
	- <img src="imgs/python-script-setup/Screenshot from 2025-09-03 16-52-13.png" width="600">

3. You might get prompted with a message: "Do you trust the authors of the files in this folder?" Read through this and make sure you understand what it is asking, then select "Yes, I trust the authors". (It's up to you if you want to do this for the whole parent folder `ps-scripts/` or only per-script.)
	- <img src="imgs/python-script-setup/Pasted image 20250903133609.png" width="300">
	- <img src="imgs/python-script-setup/Pasted image 20250903143554.png" width="300">
4. You may also get a notification from the extensions icon that the app needs to update/restart:
	 - <img src="imgs/python-script-setup/Pasted image 20250903143647.png" alt="Extensions that need to be updated" width="300">
5. Alright, now hopefully we're all settled into VS Code. You can check it worked by verifying the "root" in the Explorer pane of VS Code shows the folder name (in upper-caps):
	- <img src="imgs/python-script-setup/Pasted image 20250902143233.png" alt="VS Code Explorer pane showing YT-DLP folder" width="400">


---

### 3. Set up Virtual Environment ( `venv`) for this specific script
We're ready to set up a "virtual environment", or [venv](https://docs.python.org/3/library/venv.html), in which we'll run our script. With Python, the ideal setup is to run each program or script in its own "runtime environment," rather than let it loose in your general operating system's environment. There are a lot of reasons why, but for those of us just running a script, the most practical are 1) it's safer and 2) it makes it easier for us to install and manage per-script dependencies on other libraries or apps without polluting or messing with our computer's global Python setup. Every time we want to run a script, we'll start fresh with the baseline we got when we installed Python without needing to worry about what such-and-such script might've done.

Let's do it. 
1. In VS Code, open the Command Palette by going to View > Command Palette or using the hotkey:
	- Windows/Linux: CTRL+SHIFT+P
	- Mac: CMD+SHIFT+P
2. Start typing "Python: Create Environment" and then select it from the list:
	- <img src="imgs/python-script-setup/Pasted image 20250902144605.png" alt="VS Code Command Palette showing Python Create Environment option" width="600">
3. Select Venv from the options:
	- <img src="imgs/python-script-setup/Pasted image 20250902144651.png" alt="Python environment type selection showing Venv option" width="600">
4. Select the Global Python interpreter to kick off our venv. If you see multiple options, select the newest one. (Mac and Linux sometimes already have an older version of Python installed; we want to make sure to use the one we just installed!)
	- <img src="imgs/python-script-setup/Pasted image 20250902144731.png" alt="Python interpreter selection dialog" width="600">
	- <img src="imgs/python-script-setup/Pasted image 20250903150405.png" width="600">
5. VS Code will pop a notification to tell us it's doing the thing, and then that it's finished:
	- <img src="imgs/python-script-setup/Pasted image 20250902144801.png" alt="VS Code notification: Creating Python environment" width="600">
	- <img src="imgs/python-script-setup/Pasted image 20250902144851.png" alt="VS Code notification: Python environment created successfully" width="600">
6. To verify all's good so far, make sure that in the Explorer pane, you see a new .venv/ folder under the root of our script folder:
	- <img src="imgs/python-script-setup/Pasted image 20250902144928.png" alt="VS Code Explorer showing .venv folder created" width="600">

The steps we just followed are VS Code's way of doing what you might see elsewhere as the following command: 
```bash
python -m venv .venv.
```

---

### 4. Verify the venv's good-to-go
Finally, let's open up the integrated terminal inside VS Code to make sure it's using the right environment. 
1. Go to View > Terminal or use the hotkey (`Ctrl` + \` (tilde) in Windows/Linux, and `⌃` + \` on Mac). 
2. (If you had the terminal open already, you'll need to click the plus sign in the top right to start a new one to ensure it kicks off using our new venv.)

#### (Windows-only) Fix PowerShell integrated terminal issue (if needed)
If you're on Windows, VS Code may launch PowerShell as your default terminal, which can get ornery about venv environments. This happens because PowerShell's security settings block local scripts by default. You might see an error like this:
```cmd
PS C:\py-scripts\yt-dlp> & c:/py-scripts/yt-dlp/.venv/Scripts/Activate.ps1
& : File C:\py-scripts\yt-dlp\.venv\Scripts\Activate.ps1 cannot be loaded because running scripts is disabled on 
this system. For more information, see about_Execution_Policies at https:/go.microsoft.com/fwlink/?LinkID=135170.
At line:1 char:3
+ & c:/py-scripts/yt-dlp/.venv/Scripts/Activate.ps1
+   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : SecurityError: (:) [], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess
```
If you don't hit any error—sick! Skip down to [Verify the venv's ready in Windows](#verify-the-venvs-ready).

If you do hit an error like this, to work around it you can launch an instance of Windows Command Prompt instead. In the top-right of the terminal, click the dropdown arrow next to the plus sign, and select Command Prompt:

<img src="imgs/python-script-setup/Pasted image 20250902145602.png" alt="VS Code terminal dropdown showing Command Prompt option" width="300">

(Note: Advanced users can alternatively run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` in PowerShell if they want to keep using it instead of command prompt.)


#### Verify the venv's ready
Now you should see a command prompt terminal, and it should already have run a command to activate the venv; something like this, in windows:
```cmd
C:\py-scripts\yt-dlp>c:/py-scripts/yt-dlp/.venv/Scripts/activate.bat
(.venv) C:\py-scripts\yt-dlp>
```

or this on Mac/Linux:
```bash
source /Users/your-name/py-scripts/yt-dlp/.venv/bin/activate
user@user-computer yt-dlp % source /Users/your-name/py-scripts/yt-dlp/.venv/bin/activate
(.venv) user@user-computer yt-dlp %
```

Notice how the new-line has (.venv) in front. This means it's using the right environment, our newly made venv. If that didn't work right, you can try re-launching VS Code in this folder or starting a new terminal window.

Stay in the venv-activated terminal and move on to the next section!

---

### 5. Download / "install" the Python Script into the venv using pip
It's time to install our example script, `yt-dlp`!

We're going to use the official Python Package installer, which is called `pip` for some unholy reason. Installable packages can be found on the official site at https://pypi.org/.

You can read about yt-dlp on the pip site at https://pypi.org/project/yt-dlp/ or you can check out its open source repository at https://github.com/yt-dlp/yt-dlp.

Steps:
1. Type the following into the terminal on a new line: `pip install yt-dlp`
2. You should see something like...
```
(.venv) C:\py-scripts\yt-dlp>pip install yt-dlp
Collecting yt-dlp
  Downloading yt_dlp-20##.##.##-py3-none-any.whl.metadata (175 kB)
Downloading yt_dlp-20##.#.##-py3-none-any.whl (3.3 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.3/3.3 MB 50.7 MB/s  0:00:00
Installing collected packages: yt-dlp
Successfully installed yt-dlp-20##.##.##
```


If you see this warning as `yt-dlp` installs, make sure you installed the latest Python from the first part of the guide
```bash
Deprecated Feature: Support for Python version 3.9 has been deprecated. Please update to Python 3.10 or above
```

---

## Part 3: Steps to run the script from the venv inside VS Code
Now we're ready to run the script. Let's walk through a couple methods here, from "most barebones" to "most fancy/complicated."

### Barebones Method: Terminal Commands
Let's start with the most straightforward approach - running the script directly from the terminal.

1. Copy the following command in your usual way (`Ctrl+C` or `Cmd+C`).
```bash
yt-dlp "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
```
2. Pasting into terminals is sort of annoying. You can't really use `Ctrl/Cmd+C` and `Ctrl/Cmd+V` like we're used to. To get around this, you could type the entire command out (don't subject yourself to that!), or you could:
	- Windows Command Prompt: Right-click inside the terminal window to paste, or use `Ctrl+Shift+V`
 	- Windows PowerShell: Right-click inside the terminal window to paste, or use `Ctrl+V` (newer versions)
  	- Mac Terminal: `Cmd+V` to paste
	- Linux Terminal: `Ctrl+Shift+V` to paste
3. Press enter if needed to get to a new line, and...
4. ...watch yt-dlp do its thing:
```bash
(.venv) C:\py-scripts\yt-dlp>yt-dlp "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
[youtube] Extracting URL: https://www.youtube.com/watch?v=dQw4w9WgXcQ 
[youtube] dQw4w9WgXcQ: Downloading webpage ...
```
4. Find the result of our download in the script's root folder, visible inside VS Code:
	- <img src="imgs/python-script-setup/Pasted image 20250902151109.png" alt="Downloaded video file visible in VS Code Explorer" width="600">

### Sidequest: Understanding Command Arguments
We can pass in more "arguments" or "args" to customize how the script runs. Type and run this to see all the options:
```bash
yt-dlp --help
```

So that you can get a feel for using options and args, let's try one extra arg. `-P` is an option for specifying what folder in which we want the video to download into. If we do `-P my-vids`, `yt-dlp` will auto-create a folder under our current spot, and put the new video inside it. If you want it to download into your OS's standard "videos" location, you could do:
- Windows: `-P %USERPROFILE%\Videos\`
- Mac: `-P ~/Movies/`
- Linux: `-P ~/Videos/`

Try running the command like this for a custom folder:
```bash
yt-dlp -P rickroll-vids "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
```

Here are some other examples you can try that we won't go into depth on here. Check out https://github.com/yt-dlp/yt-dlp#readme for more details.
```bash
# custom path and filename
yt-dlp -P my-downloads -o "%(title)s.%(ext)s" "https://www.youtube.com/watch?v=dQw4w9WgXcQ"

# get info about video without actually downloading it
yt-dlp --print "%(title)s by %(uploader)s - %(duration_string)s" "https://www.youtube.com/watch?v=dQw4w9WgXcQ"

# download a low quality version
yt-dlp -P small-files -f "worst[height>=360]" "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
```

### Advanced Method: VS Code Debugger
If you're going to run a script a lot and you want to use a more UI-friendly interface rather than the terminal, you can us the VS Code debugger and set up a `launch.json`. This is particularly nice if you've got specific arguments you want to run every time, and you want to customize them sometimes.

1. Click the "Run and Debug" icon in the left sidebar of VS Code (looks like a play button with a bug) (or use `Ctrl+Shift+D` (Windows/Linux) or `Cmd+Shift+D` (Mac))
	- <img src="imgs/python-script-setup/Pasted image 20250902160405.png" alt="VS Code Run and Debug panel icon" width="300"> 
2. Click the "create a launch.json file" link
3. VS Code will ask what type of configuration - select "Python Debugger"
	- <img src="imgs/python-script-setup/Pasted image 20250903150926.png" width="600">
4. Choose "Python File" from the options
	- <img src="imgs/python-script-setup/Pasted image 20250902160622.png" alt="VS Code Python debugger template selection" width="600">
5. Note that it creates the file under a new folder, called `.vscode/`, which you can see by swapping back to the Explorer pane
	- <img src="imgs/python-script-setup/Pasted image 20250902160650.png" alt="VS Code Explorer showing .vscode folder and launch.json file" width="300">
6. Now we'll edit the generated launch.json. VS Code creates a basic file, but we want to customize it. Replace the contents with something like the below. 
	- (NOTE: text starting with `//` are comments, there to explain what the line is doing in our example, which are allowed in VS Code's launch.json but not in normal JSON.)
 
```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [

        {
            "name": "yt-dlp: Download Video",
            "type": "debugpy",
            "request": "launch",
            "module": "yt_dlp",
            "args": [
                "-P", "downloads", // the folder. under the workspace root, where the download will go
                "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
            ],
            "console": "integratedTerminal",
            "cwd": "${workspaceFolder}"
        },
        {
            "name": "yt-dlp: Custom URL",
            "type": "debugpy", 
            "request": "launch",
            "module": "yt_dlp",
            "args": [
                "-P", "custom-downloads", // the folder where the download will go
                "${input:videoURL}"
            ],
            "console": "integratedTerminal"
        }
    ],
    "inputs": [
        {
            "id": "videoURL", // we're making our own custom arg name here for the debugger itself, to prompt us for a custom URL
            "description": "Enter video URL",
            "default": "https://www.youtube.com/watch?v=dQw4w9WgXcQ", // if you forget to enter one, you get to see Rick again
            "type": "promptString" // when you use this debug mode, VS Code's UI will prompt you for the URL
        }
    ]
}
```

7. Run your configurations
	- In the Run and Debug panel, you'll see a dropdown with your configuration names
		- <img src="imgs/python-script-setup/Pasted image 20250902160522.png" alt="VS Code debug configuration dropdown" width="150">
	- Select one and click the green play button.
	- You can tell the "Download Video" one worked if you now have a folder called "downloads" under the yt-dlp folder, and it has Rick's video in it.
	- For the "Custom URL" option, it'll prompt you to enter a URL, and you can use the same one. For this one, after it runs, you should see a "custom-downloads/" folder with the video in it.
		- <img src="imgs/python-script-setup/Pasted image 20250902160729.png" alt="VS Code input prompt for custom video URL">
8. After all our steps, we've got a lot of Rick:
	- <img src="imgs/python-script-setup/Pasted image 20250903151217.png" width="300">

Woo, we did it!

---

## What you've accomplished
Let's review what we've done so you can reference it later.
- Installed Python and VS Code on your computer
- Set up a folder structure for organizing Python scripts
- Downloaded and organized a Python script in its own dedicated folder
- Got comfortable with VS Code's basic interface
- Created a virtual environment (`venv`) for clean package management
- Successfully ran your first script in its isolated environment

---


## Other Useful Python Scripts you can check out and install with pip
- [gallery-dl](https://pypi.org/project/gallery-dl/)
- [csvkit](https://pypi.org/project/csvkit/)
- [internetarchive cli tool `ia`](https://pypi.org/project/internetarchive/)

**Note**: If the script you want isn't showing up on the PyPi site as pip-installable, it may need a different installation method - check the script's documentation for details. Other common flows are:
- get source code from as a zip from GitHub
- clone the repo files locally from GitHub or GitLab
- use curl to download binaries

---

## Further Reading
- [Python environments in VS Code](https://code.visualstudio.com/docs/python/environments#_creating-environments) - Official VS Code documentation on using virtual environments
- [Learning Resources](learning-resources.md) - Links I've collected to other helpful (external) tutorials and guides
