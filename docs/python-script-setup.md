# Get Set Up to Install and Run Python Scripts on Your Computer

## Overview
This is a quick and easy guide to help you get set up to run Python scripts on your computer. We'll cover the steps necessary for Windows 11, macOS, and Linux (via Ubuntu).

### Audience
Tech-savvy folks who:
- found a Python script online and want to run it
- don't have a Python development environment set up yet
- are comfortable with basic computer tasks
- want to get something working quickly (no coding required)

We're going to be using the terminal (also called commandline, console, or shell), but it's completely fine if you're not used to doing that; you don't need existing experience.

### Goal
Get from "I found this useful .py script" to "it's running on my computer" with minimal fuss and a sustainable setup for future tools.

## Guide/Steps
### Install Python

### Install VS Code
(a free & open-source "IDE" or Integrated Development Environment)
### Get Folder Structure Ready
Split this out on Win/mac/Linux
Windows: `C:\py-scripts\`
Mac/Linux: `~/py-scripts/`
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
- [Python environments in VS Code](https://code.visualstudio.com/docs/python/environments#_creating-environments) - official VS Code documentation on using virtual environments
- [Learning Resources]([[learning-resources]]) - links I've collected to other helpful (external) tutorials and guides
### Other Useful Python Scripts
#TODO change to the pip pages with repo as secondary link
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [gallery-dl](https://github.com/mikf/gallery-dl)
- [csvkit](https://csvkit.readthedocs.io/en/latest/)
- [internetarchive cli tool `ia`](https://archive.org/developers/internetarchive/cli.html)
