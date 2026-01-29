# How to Annotate Code Without Modifying Source Files

## Overview

This guide covers how to annotate a codebase without modifying source files. We'll use VS Code and the [Line Note Extension](https://marketplace.visualstudio.com/items?itemName=tkrkt.linenote) (MIT License) to add inline annotations that stay separate from your code.

**Example use case**: When working on my own code or a forked repository, I can use code comments to annotate as I read line-by-line. But what about when I can't or don't want to modify the source? Perhaps the version control system doesn't allow branching, or I simply don't want to pollute the original files with my learning notes. I want something like MS Word's inline comments for code.

---

MS Word's inline comment feature:

<img src="imgs/ms_word_annotation.png" alt="MS Word's inline comment feature" width="600">

How our VS Code + Line Notes workflow will look:

<img src="imgs/overview_img_of_finished_setup.png" alt="How our VS Code workflow will look after setup" width="600">

---

**Important limitation**: Annotations are tied to specific line numbers. If code changes (lines added/removed, files moved), you'll need to manually update your notes. This works best for stable codebases or when you include enough context in notes to relocate them manually.

---

## Setup Steps

### 1. Install Line Note Extension

- Install from: https://marketplace.visualstudio.com/items?itemName=tkrkt.linenote
- Or in VS Code: Extensions → search "Line Note" by tkrkt

### 2. Add to version control ignore file

The extension stores notes in `.vscode/linenote/` inside your repository or VS Code workspace. Add the below to your ignore file so notes don't get committed. You may need to create this file in the root of the workspace folder/repository if it doesn't already exist:

**For Git** - add to `.gitignore`:
```
.vscode/linenote/
```

**For Perforce** - add to `.p4ignore`:
```
.vscode/linenote/
```

### 3. Start annotating

Open your repository in VS Code. Right-click on any line and select "Line Note: Add note at current position":

<img src="imgs/00_add_note_context_menu.png" alt="Right-click context menu showing Add note at current position" width="600">

Write your note and save:

<img src="imgs/01_annotate_code_line.png" alt="Writing a note in Line Note" width="600">

You'll see a visual indicator on lines with notes:

<img src="imgs/02_see_note_inline.png" alt="Note indicator and inline display" width="600">

---

### Optional: Set up a keyboard shortcut

To add notes faster:

1. Open Keyboard Shortcuts: File → Preferences → Keyboard Shortcuts (or `Ctrl+K Ctrl+S` on Windows/Linux, `Cmd+K Cmd+S` on Mac)
2. Search for "Line Note: Add note at current position"
3. Click the + icon to add a keybinding
4. Press your desired key combination (e.g., `Ctrl+Alt+N`)

<img src="imgs/keyboard_short.png" alt="Example of keyboard shortcut set" width="600">

---

## Optional (Advanced): Store Notes in a Separate "Vault"

If you want to store notes outside your repository (for backup, version control, or organization across multiple codebases), you can use a junction/symlink.

### 1. Create a vault folder

```bash
# Windows
mkdir C:\my_notes_vault\my_repo_notes

# Unix/Mac
mkdir -p ~/my_notes_vault/my_repo_notes
```

Replace `my_repo_notes` with a name that identifies which codebase you're annotating.

### 2. Create a junction in your source repository

Navigate to your source repository and create a junction/symlink from `.vscode/linenote/` to your vault folder:

```bash
# Navigate to your source repository
cd C:\path\to\your\repo  # Windows
cd /path/to/your/repo    # Unix/Mac

# Windows PowerShell - create junction
New-Item -ItemType Junction -Path .vscode\linenote -Target C:\my_notes_vault\my_repo_notes

# Windows Command Prompt (cmd) - create junction
# the syntax here is mklink /J <source_dir> <target_dir>
mklink /J .vscode\linenote C:\my_notes_vault\my_repo_notes

# Unix/Mac - create symlink
# the syntax here is the opposite of the above; ln -s <target_dir> <source_dir>
ln -s ~/my_notes_vault/my_repo_notes .vscode/linenote
```

<details>
<summary>What is this doing?</summary>

A junction/symlink is a pointer to another folder. When Line Note creates annotation files in `.vscode/linenote/`, those files will actually be written to your vault folder. This keeps your notes separate from the source code while making them accessible to VS Code.
</details>

---

## Further Reading

- [Line Note Extension](https://marketplace.visualstudio.com/items?itemName=tkrkt.linenote) - Official marketplace page
- [Line Note GitHub Repository](https://github.com/tkrkt/linenote) - Source code and documentation
- [ln command in Unix](https://www.unixtutorial.org/commands/ln/)
- [mklink in cmd](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/mklink)
- [SuperUser: "directory junction" vs "directory symbolic link"?](https://superuser.com/a/343079)
