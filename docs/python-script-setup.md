# Get Set Up to Install and Run Python Scripts on Your Computer

## Overview
This is a quick and easy guide to help you get set up to run Python scripts on your computer. We'll cover the steps necessary for Windows 11, macOS, and Linux (via Ubuntu).

### Audience
Tech-savvy folks who:
- found a Python script online and want to run it
- don't have a Python development environment set up yet
- are comfortable with basic computer tasks
- want to get something working quickly (no coding required)

We're going to be using the terminal (also called the command line, console, or shell), but it's completely fine if you're not used to doing that; you don't need existing experience.

### Goal
Get from "I found this useful .py script" to "it's running on my computer" with minimal fuss and a sustainable setup for future tools.

## One-Time per Computer Steps: 
### Install Python
Go to https://www.python.org/downloads/ and download and install the newest version of Python for your platform.

Windows:
<img src="imgs/python-script-setup/Pasted image 20250902130347.png" alt="Python download page for Windows" width="500">

Mac:
{ADD}

LINUX:
{ADD}

#### What is this, and why am I installing it?
This installation includes the essential program to read and execute Python code, the Python Core Interpreter. That translates Python code into instructions your computer can understand and act on. The installation also includes other key components we'll need to run a Python script locally, like the Standard Library, the Package Manager (pip), and Runtime Environment system files and configurations that allow Python to run on each operating system.

### Install VS Code
Go to https://code.visualstudio.com/download and download and install the newest version of VS Code for your platform.

<img src="imgs/python-script-setup/Pasted image 20250902131142.png" alt="VS Code download page" width="500">

#### What is this, and why am I installing it?
VS Code is a free and open-source "IDE" or Integrated Development Environment. We're installing it so that we have an easy graphical user interface (GUI) with which we can inspect and run Python scripts safely in their own isolated "virtual environments." (We'll set up virtual environments shortly to keep each script's requirements separate.)

Note: You could accomplish the same things using just the terminal, but VS Code makes the process more visual and user-friendly.
### Get Folder Structure Ready
Now that we've got the necessary software installed, let's create a specific folder for housing Python scripts we want to install. 

Think of this as a folder similar to `c:\Program Files\` in Windows, `/Applications/` in Mac, or `/usr/local/bin/` in Linux, except we're setting this one up specifically to store Python scripts and what we need to run them.

You can create this new folder wherever you wish; but here's my suggested spot for where to create it:
- In Windows: `C:\py-scripts\`
- Mac/Linux: `~/py-scripts/`

Create this folder using your operating system's file manager: navigate to the folder, right-click, and select "New Folder" in Windows/Linux; or, in Mac's Finder, use `Cmd+Shift+N`.

Windows:
<img src="imgs/python-script-setup/Pasted image 20250902131953.png" alt="Windows File Explorer showing C: drive" width="600">

<img src="imgs/python-script-setup/Pasted image 20250902141805.png" alt="Creating new folder in Windows" width="600">

Mac:
{ADD}

Linux:
{ADD}

## Steps per new Python Script
### Create a Folder for a new script
To get set up to install our first Python Script, let's make a new folder inside the one we just made. For our example we're going to install `yt-dlp`, so let's create a folder with that name:

<img src="imgs/python-script-setup/Pasted image 20250902141839.png" alt="Creating yt-dlp folder" width="600"> 

### Open new script folder in VS Code
We next want to open this folder as a "workspace" in VS Code. 

Windows: 
- Launch VS Code from **Start** > **Search** > type in `vs code` > Click **Open**
	- <img src="imgs/python-script-setup/Pasted image 20250902142931.png" alt="Launching VS Code from Windows Start menu" width="500">

Mac:
{ADD}

Linux:
{ADD}

From inside VS Code, go to File > Open Folder:

<img src="imgs/python-script-setup/Pasted image 20250902143052.png" alt="VS Code File menu Open Folder option" width="500">

<img src="imgs/python-script-setup/Pasted image 20250902143143.png" alt="VS Code folder selection dialog" width="500">

You can check it worked by verifying the "root" in the Explorer pane of VS Code shows the folder name (in upper-caps):

<img src="imgs/python-script-setup/Pasted image 20250902143233.png" alt="VS Code Explorer pane showing YT-DLP folder" width="500">

Mac:
{ADD}

Linux:
{ADD}

### Take a moment to look at VS Code's UI
{ ADD, with pictures }
Here's a quick tour of the UI and what I'll be calling different parts of it throughout the rest of the guide. Don't worry about if your UI doesn't match the screenshots at the moment (it probably doesn't), and don't worry about understanding the descriptions right now; they're there for your future reference.
1. **Explorer** pane (file tree) - where we'll see the folder structure per-script
2. **Editor** area - where files open
3. **Integrated Terminal** - where we'll run commands
4. **Run and Debug** panel - for the advanced script launcher

<img src="imgs/python-script-setup/Pasted image 20250902160012.png" alt="VS Code UI overview showing main panels" width="600">

<img src="imgs/python-script-setup/Pasted image 20250902160154.png" alt="VS Code UI with terminal and debug panels highlighted" width="600">

### Set up Virtual Environment ( `venv`) for this specific script
We're ready to set up a "virtual environment", or [venv](https://docs.python.org/3/library/venv.html),  in which we'll run our script. With Python, the ideal setup is to run each program or script in its own "runtime environment," rather than let it loose in your general operating system's environment. There are a lot of reasons why, but for those of us just running a script, the most practical are 1) it's safer and 2) it makes it easier for us to install and manage per-script dependencies on other libraries or apps without polluting or messing with our computer's global Python setup. Every time we want to run a script, we'll start fresh with the baseline we got when we installed Python without needing to worry about what such-and-such script might've done.

Let's do it. 
1. In VS Code, open the Command Palette by going to View > Command Palette or using the hotkey:
	- Windows/Linux: CTRL+SHIFT+P
	- Mac: CMD+SHIFT+P
2. Start typing "Python: Create Enviornment" and then select it from the list:
	- <img src="imgs/python-script-setup/Pasted image 20250902144605.png" alt="VS Code Command Palette showing Python Create Environment option" width="600">
3. Select Venv from the options:
	- <img src="imgs/python-script-setup/Pasted image 20250902144651.png" alt="Python environment type selection showing Venv option" width="600">
4. Select the Global Python interpreter to kick off our venv:
	- <img src="imgs/python-script-setup/Pasted image 20250902144731.png" alt="Python interpreter selection dialog" width="600">
5. VS Code will pop a notification to tell us it's doing the thing, and then that it's finished:
	- <img src="imgs/python-script-setup/Pasted image 20250902144801.png" alt="VS Code notification: Creating Python environment" width="600">
	- <img src="imgs/python-script-setup/Pasted image 20250902144851.png" alt="VS Code notification: Python environment created successfully" width="600">
6. To verify all's good so far, make sure that in the Explorer pane, you see a new .venv/ folder under the root of our script folder:
	- <img src="imgs/python-script-setup/Pasted image 20250902144928.png" alt="VS Code Explorer showing .venv folder created" width="600">

### Verify the venv's good-to-go
Finally, let's open up the integrated terminal inside VS Code to make sure it's using the right environment. Go to View > Terminal or use the hotkey (Ctrl+\` in Windows/Linux, and Cmd+\` on Mac) .

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
If you don't hit any error—sick! Skip down to [[#Verify the venv's ready in Windows]]. 

If you do hit an error like this, to work around it you can launch an instance of Windows Command Prompt instead. In the top-right of the terminal, click the dropdown arrow next to the plus sign, and select Command Prompt:
<img src="imgs/python-script-setup/Pasted image 20250902145602.png" alt="VS Code terminal dropdown showing Command Prompt option" width="300">

(Note: Advanced users can alternatively run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` in PowerShell if they want to keep using it instead of command prompt.)
#### Verify the venv's ready in Windows 
Now you should see a command prompt terminal, and it should already have run a command to activate the venv; something like this:
```cmd
C:\py-scripts\yt-dlp>c:/py-scripts/yt-dlp/.venv/Scripts/activate.bat
(.venv) C:\py-scripts\yt-dlp>
```
Notice how the new-line has (.venv) in front. This means it's using the right environment, our newly made venv. If that didn't work right, you can try re-launching VS Code in this folder. Otherwise, stay in the venv-activated terminal and move on to the next section!

#### (TODO) Verify venv's ready on Mac/Linux
{ADD}

### Download / "install" the Python Script into the venv
It's time to install our example script, `yt-dlp`!

Type the following into the terminal on a new line:
`pip install yt-dlp`

You should see something like...
```
(.venv) C:\py-scripts\yt-dlp>pip install yt-dlp
Collecting yt-dlp
  Downloading yt_dlp-20##.##.##-py3-none-any.whl.metadata (175 kB)
Downloading yt_dlp-20##.#.##-py3-none-any.whl (3.3 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.3/3.3 MB 50.7 MB/s  0:00:00
Installing collected packages: yt-dlp
Successfully installed yt-dlp-20##.##.##
```

{UPDATE BELOW}
📝 **Note**: If the script you want isn't showing up on the PyPi site as pip-installable, it may need a different installation method - check their documentation for details. Other common flows are:
- get source code from as a zip from GitHub
- clone the repo files locally from GitHub or GitLab
- use curl to download binaries

### Run the script from the venv inside vs code
Now we're ready to run the script. I'm going to walk you through a couple of methods here, from "most barebones" to "most fancy/complicated"

#### Barebones: Run the script with command line arguments directly from the VS Code Integrated Terminal
Let's start with the most straightforward approach - running commands directly in the terminal.

Simplest run:
```bash
yt-dlp "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
```


The result of this should appear in the root folder, visible inside VS Code:
<img src="imgs/python-script-setup/Pasted image 20250902151109.png" alt="Downloaded video file visible in VS Code Explorer" width="600">

We can pass in more "arguments" or "args" to customize how the script runs. Type and run this to see all the options:
```
yt-dlp --help
```

So that you can get a feel for some examples, let's try one extra arg. `-P` is an option for specifying what folder in which we want the video to download into. If we do `-P my-vids`, it'll auto-create a folder under our current spot, and put the new video inside it. If you want it to download into your OS's standard "videos" location, you could do:
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
#### Fancy/Complicated: Run the script with VS Code's debugging launcher 
If you're going to run a script a lot and you want to use a more UI-friendly interface rather than the terminal, you can us the VS Code debugger and set up a `launch.json`. This is particularly nice if you've got specific arguments you want to run every time, and you want to customize them sometimes.

**Step 1: Open the Run and Debug panel**
- Click the "Run and Debug" icon in the left sidebar of VS Code (looks like a play button with a bug)
- Or use `Ctrl+Shift+D` (Windows/Linux) or `Cmd+Shift+D` (Mac)
- <img src="imgs/python-script-setup/Pasted image 20250902160405.png" alt="VS Code Run and Debug panel icon" width="300">

**Step 2: Create launch configuration**
- Click "create a launch.json file" link
- VS Code will ask what type of configuration - select "Python Debugger"
	- <img src="imgs/python-script-setup/Pasted image 20250902160429.png" alt="VS Code debugger configuration type selection" width="600">
- Choose "Python File" from the options
	- <img src="imgs/python-script-setup/Pasted image 20250902160622.png" alt="VS Code Python debugger template selection" width="600">
- Note that it creates the file under a new folder, called `.vscode/`
	- <img src="imgs/python-script-setup/Pasted image 20250902160650.png" alt="VS Code Explorer showing .vscode folder and launch.json file" width="300">

**Step 3: Edit the generated launch.json** 
VS Code creates a basic file, but we want to customize it. Replace the contents with something like the below. 
(NOTE: text starting with `//` are comments, there to explain what the line is doing in our example, which are allowed in VS Code's launch.json but not in normal JSON.)
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

**Step 4: Run your configurations**
- In the Run and Debug panel, you'll see a dropdown with your configuration names
	- <img src="imgs/python-script-setup/Pasted image 20250902160522.png" alt="VS Code debug configuration dropdown" width="150">
- Select one and click the green play button
- For the "Custom URL" option, it'll prompt you to enter a URL
	- <img src="imgs/python-script-setup/Pasted image 20250902160729.png" alt="VS Code input prompt for custom video URL">

## What you've accomplished
Let's review what we've done so you can reference it later.
- Installed Python and VS Code on your computer
- Set up a folder structure for organizing Python scripts
- Downloaded and organized a Python script in its own dedicated folder
- Got comfortable with VS Code's basic interface
- Created a virtual environment (`venv`) for clean package management
- Successfully ran your first script in its isolated environment

## Further Reading
- [Python environments in VS Code](https://code.visualstudio.com/docs/python/environments#_creating-environments) - official VS Code documentation on using virtual environments
- [Learning Resources]([[learning-resources]]) - links I've collected to other helpful (external) tutorials and guides
### Other Useful Python Scripts
#TODO change to the pip pages with repo as secondary link
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [gallery-dl](https://github.com/mikf/gallery-dl)
- [csvkit](https://csvkit.readthedocs.io/en/latest/)
- [internetarchive cli tool `ia`](https://archive.org/developers/internetarchive/cli.html)
