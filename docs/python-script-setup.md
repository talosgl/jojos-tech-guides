# Get set up to run python scripts on your computer

## Overview
This is a quick and easy guide to help you get set up to run Python scripts on your computer. We'll cover the steps necessary for Windows 11, macOS, and Linux (via Ubuntu).

### Audience
Tech-savvy folks who:
- found a Python script online and want to run it
- don't have a Python development environment set up yet
- are comfortable with basic computer tasks
- want to get something working quickly (no coding required)

We're going to be using the terminal (also called commandline, console, or shell), but it's completely fine if you're not used to doing that.

### Goal
Get from "I found this useful .py script" to "it's running on my computer" with minimal fuss and a sustainable setup for future tools.


## Guide/Steps
### Install Python

### Install VS Code
(a free & open-source "IDE" or Integrated Development Environment)
### Get Folder Structure Ready
Split this out on Win/mac/Linux

### Set up venv
- Open the soon-to-be-gotten script's folder in VS Code as a "workspace"
- CTRL+SHIFT+P
- etc...
### Download / "install" the Python Script into the venv
Golden path:
- pip if available


📝 **Note**: If the script you want isn't showing up on the PyPi site as pip-installable, it may need a different installation method - check their documentation for details. Other common flows are:
- get source code from as a zip from GitHub
- clone the repo files locally from GitHub or GitLab
- use curl to download binaries

### Run the script from the venv inside vs code

## What you've accomplished
Let's review what we've done so you can reference it later.
- Installed Python and VS Code on your computer
- Set up a folder structure for organizing Python scripts
- Downloaded and organized a Python script in its own dedicated folder
- Got comfortable with VS Code's basic interface
- Created a virtual environment (`venv`) for clean package management
- Successfully ran your first script in its isolated environment

## Further Reading
### Other Useful Python Scripts
#TODO change to the pip pages with repo as secondary link
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [gallery-dl](https://github.com/mikf/gallery-dl)
- [csvkit](https://csvkit.readthedocs.io/en/latest/)
- [internetarchive cli tool `ia`](https://archive.org/developers/internetarchive/cli.html)

### Deep-dive Learning Resources
About Python virtual environments:
- [Python environments in VS Code](https://code.visualstudio.com/docs/python/environments#_creating-environments)
- [venv — Creation of virtual environments]( https://docs.python.org/3/library/venv.html)
- [Virtual Environments and Packages](https://docs.python.org/3/tutorial/venv.html)

About Python development:
 - [Programming with Python](https://swcarpentry.github.io/python-novice-inflammation/) by Software Carpentry: 
	 - "This lesson teaches novice programmers to write modular code to perform data analysis using Python. The emphasis, however, is on teaching language-agnostic principles of programming such as automation with loops and encapsulation with functions..."
 - [The Python Tutorial](https://docs.python.org/3/tutorial/index.html)
	 -  This tutorial is designed for programmers that are new to the Python language, not beginners who are new to programming.

Get more comfortable using the terminal:
- Guide to [The Unix Shell](https://swcarpentry.github.io/shell-novice/) by Software Carpentry:
	- "An introduction to the Unix shell for people who have never used the command line before."