
# How to Annotate Code Without Modifying Source Files



### Set up folder structure and junction
Create a folder that will house your notes (the vault).

We recommend creating a dedicated location outside of cloud-synced folders (like Documents, Desktop, or iCloud) to avoid potential conflicts with git operations.

Create a dev folder and navigate to it:
```bash
# Windows
mkdir C:\dev
cd C:\dev

# Unix/Mac
mkdir -p ~/dev
cd ~/dev
```

Make the new directory for your annotations:
```bash
mkdir my_repo_annotations
cd my_repo_annotations
```

Now we want to create a junction or symlink to the codebase we want to annotate. 

<details>
<summary>Why/What is this?</summary>

It's basically a pointer to the real folder, formatted in a manner where VS Code will display it as if the folder were living in this spot instead of wherever its actual parent folder is.

You don't really need to understand this in depth, just know that any changes you make in a junctioned version of a directory are going to write to the REAL directory. In other words you probably do not want to ever edit the code from here. It is intended as a read-only view for your notes. If you are using a version control system for your code that does not allow auto-checkout on edit, then that should protect you from accidentally editing the codebase.
</details>

Still from inside `my_repo_annotations`, create the Junction/Symlink like so:

```bash
# Windows (PowerShell) - use Junction
New-Item -ItemType Junction -Path codebase -Target C:\path\to\actual\repo

# OR on Unix/Mac - use symlink
ln -s /path/to/actual/repo codebase
```

### Open my_repo_annotations as the root folder in VS Code

```bash
code .
```

(Or File → Open Folder → select my_repo_annotations)


### Get Line Note Extension
Ensure Line Note extension is installed

Install from: https://marketplace.visualstudio.com/items?itemName=tkrkt.linenote
Or in VS Code: Extensions → search "Line Note" by tkrkt


### Add your first annotation

Navigate to any file in codebase/ within VS Code
Right-click on a line → "Line Note: Add note at current position"
Write your note, save
Verify the setup

Check that .vscode/linenote/ was created in my_repo_annotations (not in the actual repo)


### (Optional) Set up a local git repo for your notes

In this scenario, we want a git repo for ONLY our notes, not the codebase that we're learning and annotating. Therefore, we must explicitly ignore the junctioned/symlinked version of the codebase in our .gitignore.

**Note:** If you created your annotation vault in a cloud-synced location (OneDrive, Dropbox, iCloud, etc.), be aware that syncing the `.git` folder can cause conflicts. You should probably choose EITHER git or your cloud-sync (if you choose git, move the vault out of the cloud-sync location). If you really want to try both, consider excluding the `.git` folder from cloud sync.

Initialize git from inside `my_repo_annotations`:
```bash
git init
```

Create a `.gitignore` file:
```bash
# Ignore the junction/symlink to the actual codebase (at root only)
/codebase/

# OS files
.DS_Store
Thumbs.db
```

Make your first commit:
```bash
git add .gitignore
git commit -m "Initial commit: set up annotation vault"
```
