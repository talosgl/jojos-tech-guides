# Python Virtual Environment Cheat Sheet

Quick reference for managing Python virtual environments. Assumes you've already worked through the [detailed setup guide](script-setup.md).

---

## Create New venv for a Script

### Via VS Code (Recommended)
1. `Ctrl+Shift+P` / `Cmd+Shift+P` > **Python: Create Environment**
2. Select **Venv**
3. Choose Python interpreter

### Via Terminal
```bash
# Mac/Linux
python3 -m venv .venv

# Windows
python -m venv .venv

# If you want to specify with a specific Python version (e.g. 3.13), use:
# python -<VERSION NUMBER> -m venv <FOLDER NAME YOU WANT NEW VENV TO CREATE AND USE>
py -3.13 -m venv .venv-py313
```

---

## Activate venv

### VS Code
Open integrated terminal (`` Ctrl+` `` / `` Cmd+` ``) - activates automatically

### Terminal Only
```bash
# Mac/Linux
source .venv/bin/activate

# Windows Command Prompt
.venv\Scripts\activate

# Windows PowerShell
.venv\Scripts\Activate.ps1
```

**Verify**: Look for `(.venv)` prefix in terminal prompt

---

## Install Packages

```bash
# Install a package
pip install package-name

# Install specific version
pip install package-name==1.2.3

# Update a package
pip install --upgrade package-name

# Install from requirements file
pip install -r requirements.txt
```

---

## Manage Packages

```bash
# List installed packages
pip list

# Show package info
pip show package-name

# Save current packages to file
pip freeze > requirements.txt

# Uninstall package
pip uninstall package-name
```

---

## Run Scripts/Packages

```bash
# Run installed command-line tool
package-name [arguments]

# Run Python file in current venv
python script.py

# Run with arguments
python script.py --arg1 value1

# Get help for most CLI tools
package-name --help
```

---

## Deactivate venv

```bash
deactivate
```

---

## Folder Structure Pattern

```
~/py-scripts/                    # or C:\py-scripts\
├── script-name-1/
│   ├── .venv/                  # Virtual environment
│   ├── your_script.py          # Script code (if any)
│   └── requirements.txt        # Package list (if any)
├── script-name-2/
│   ├── .venv/
│   └── ...
└── script-name-3/
    ├── .venv/
    └── ...
```

Each script gets its own folder with its own `.venv` subfolder.

---

## Troubleshooting

**Terminal shows no (.venv) prefix**
- Open new terminal window in VS Code (`` Ctrl+Shift+` ``)
- Or manually activate (see [Activate venv](#activate-venv))

**PowerShell won't activate (Windows)**
- Use Command Prompt instead
- Or run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

**Wrong Python version**
- Delete `.venv` folder
- Recreate with correct Python: `python3.13 -m venv .venv`

**Command not found after pip install**
- Verify package installed: `pip list`
- Deactivate and reactivate venv
- Check package documentation for actual command name

---

## Quick Start New Script

```bash
# Create folder
mkdir ~/py-scripts/new-script    # Mac/Linux
mkdir C:\py-scripts\new-script   # Windows

# Navigate to it
cd ~/py-scripts/new-script

# Open in VS Code
code .

# Create venv (in VS Code)
# Ctrl+Shift+P > Python: Create Environment > Venv

# Install what you need
pip install package-name

# Run it
package-name
```
