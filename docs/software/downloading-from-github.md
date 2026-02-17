# How to Download and Install Programs from GitHub

**For:** People who want to download and use software distributed on GitHub
**Platform:** Windows and macOS
**Difficulty:** Beginner-friendly

---

## What is GitHub?

GitHub is a platform where developers share and host their code. Many developers release ready-to-use programs (binaries/executables) through GitHub's "Releases" feature, so you don't need to know how to code to use their software.

---

## Finding Releases

### Step 1: Navigate to the Releases Page

On any GitHub project page, look for the "Releases" section in the right sidebar:

<img src="imgs/downloading-from-github/gh_releases_link_from_main_repo.png" alt="GitHub sidebar showing Releases section link" width="600">

Or, you can go directly to: `https://github.com/[username]/[project-name]/releases`, e.g., https://github.com/talosgl/manuscript2slides/releases

### Step 2: Find the Latest Release

Releases are listed chronologically, with the most recent at the top. Look for:
- **Version number** (e.g., v1.0.5)
- **Release date**
- **Release notes** explaining what's new or fixed

<img src="imgs/downloading-from-github/gh_releases_page.png" alt="GitHub releases page showing version numbers and release notes" width="400">

### Step 3: Choose Your Download

Under "Assets," you'll see the available downloads. Common file types:

| File Extension   | What It Is         | Platform             |
| ---------------- | ------------------ | -------------------- |
| `.zip`           | Compressed folder  | Windows/Mac/Linux    |
| `.exe`           | Windows executable | Windows only†        |
| `.dmg` or `.pkg` | Disk image/package | macOS only           |
| `.tar.gz`        | Compressed archive | Mac/Linux            |
| `Source code`    | Raw code files     | ⚠️ Not for end-users |

If you're not sure which asset to pick, look for your operating system name (Windows, macOS, Debian, Fedora, etc.) and a .zip file.

† NOTE: Modern browsers like Chrome and Firefox, and newer versions of Windows (especially Windows 11), will flag virtually all open source software as malicious or suspicious if downloaded and distributed as a pure .exe. This is why you'll mostly see open source programs distributed as .zip.

⚠️ **Tip:** Ignore "Source code" downloads unless you're a developer who wants to modify the program.

<img src="imgs/downloading-from-github/gh_release_assets_zip_arrow.png" alt="GitHub release Assets section showing ZIP download file" width="400">

---

## Download the File

1. Click on the `.zip` file (or appropriate file for your platform) in the Assets section
2. Your browser will download it (usually to your `Downloads` folder)
3. Wait for the download to complete

---

## (Optional) Advanced: Verify Your Download by Checksum

Some developers provide a **checksum** (a unique fingerprint for the file) to ensure what you downloaded is exactly what they uploaded and intended to distribute, and hasn't been corrupted or tampered with.

### What is a Checksum?

A checksum is like a fingerprint for a file. Every file has a unique checksum. By comparing checksums, you can verify:
- ✅ The file downloaded completely without corruption from data storage or network issues
- ✅ The file hasn't been modified or tampered with since it was originally uploaded/distributed
- ✅ You have the exact file the developer released

More info: [A good Stack Exchange post on this topic](https://security.stackexchange.com/questions/189000/how-to-verify-the-checksum-of-a-downloaded-file-pgp-sha-etc/189004#189004)

### How to Verify (Windows)

If the release notes include a **SHA256 Checksum**, you can verify it:

1. **Open PowerShell**
   - Press `Win + X` and select "Windows PowerShell" or "Terminal"
   - Or search for "PowerShell" in the Start menu
   - [Need help opening PowerShell?](https://learn.microsoft.com/en-us/powershell/scripting/windows-powershell/starting-windows-powershell?view=powershell-7.5)

2. **Navigate to your Downloads folder**
   ```powershell
   cd Downloads
   ```

3. **Run the checksum command**
   ```powershell
   Get-FileHash -Algorithm SHA256 filename.zip
   ```
   Replace `filename.zip` with the actual filename.

4. **Compare the output**
   - PowerShell will display a long string of numbers and letters
   - Compare it to the checksum in the release notes
   - They should match exactly (uppercase/lowercase doesn't matter)
   - You can copy/paste each and use the -eq operator to have PowerShell evaluate them

<img src="imgs/downloading-from-github/powershell_verify_checksum_hash.png" alt="PowerShell window showing checksum verification output" width="600">

### How to Verify (macOS)

1. **Open Terminal**
   - Press `Cmd + Space`, type "Terminal", and press Enter

2. **Navigate to your Downloads folder**
   ```bash
   cd ~/Downloads
   ```

3. **Run the checksum command**
   ```bash
   shasum -a 256 filename.zip
   ```
   Replace `filename.zip` with the actual filename.

4. **Compare the output**
   - Terminal will display a long string of numbers and letters
   - Compare it to the checksum in the release notes
   - They should match exactly
   - You can also have Terminal check for you by running:
     ```bash
     echo "expected_checksum_here  filename.zip" | shasum -a 256 --check
     ```
     Replace `expected_checksum_here` with the checksum from the release notes, and `filename.zip` with the actual filename. THERE MUST BE TWO SPACES BETWEEN THESE. It will output `filename.zip: OK` if they match, or `filename.zip: FAILED` if they don't.

**What if they don't match?**
- Delete the file and redownload it
- Do NOT use the file - it may be corrupted or tampered with

---

## Extract the Files

### Windows

Windows' built-in extraction works fine, but I personally prefer [7-Zip](https://www.7-zip.org/).

1. **Right-click the `.zip` file** you downloaded
2. Select **Extract All...** to use Windows' built-in extractor, or  **7-Zip → Extract to {folder name}**
3. You'll see a new folder with the extracted contents
4. It's up to you where to store the folder; it is worth considering moving it out of your default Downloads location.

<img src="imgs/downloading-from-github/windows_extraction.png" alt="Windows right-click context menu showing Extract All option" width="400">

<img src="imgs/downloading-from-github/7-zip_Extract_To_context_menu.png" alt="7-Zip context menu showing Extract to folder option" width="400">

<img src="imgs/downloading-from-github/zip_and_extracted_folder.png" alt="File explorer showing ZIP file and extracted folder side by side" width="400">

### macOS

1. **Double-click the `.zip` file** in Finder to extract it
2. You'll see the extracted contents appear in the same folder (typically a `.app` file)
3. It's up to you where to store the app; you may want to move it out of your Downloads folder (e.g., to your Applications folder or Desktop).

### What You'll See

After extraction, you'll typically find:
- **Windows:** An `.exe` file (the program itself) and supporting files and folders (DLLs, resources, etc.)
- **macOS:** A `.app` file (the program itself), which is a self-contained application bundle

⚠️ **Important (Windows):** Keep all files together in the same folder. Don't move just the `.exe` file—it needs the supporting files next to it.

---
## (If Needed) Installing the Program

Many programs distributed via GitHub releases are **portable** - they run directly from wherever you extracted them, without needing a formal installation process.

### Portable Programs (Most Common)

**Characteristics:**
- No installation needed beyond extracting the .zip
- **Windows:** You can run the `.exe` directly from the extracted folder
- **macOS:** You can run the `.app` directly, or drag it into your Applications folder
- You can move the folder/app anywhere
- Deleting the folder/app = uninstalling

### If There's an Installer

Some releases include a formal installer file:
- **Windows:** `.msi`, `setup.exe`, or `install.exe`
- **macOS:** `.dmg` or `.pkg`

1. Double-click to run the installer
2. Follow the installation wizard prompts
3. The program will typically install to `C:\Program Files\[ProgramName]\` (Windows) or `/Applications/` (macOS)

---
## Run the Program

Both Windows and macOS will show a security warning the first time you run a program downloaded from the internet. **This is normal for new programs that aren't widely downloaded yet.** Both operating systems use "reputation-based protection"—new programs or programs from smaller developers haven't built up enough downloads to establish trust, so your OS warns you to be cautious.

### First Time on Windows: SmartScreen Warning

Windows may show a security warning:

> "Windows protected your PC"
> "Microsoft Defender SmartScreen prevented an unrecognized app from starting"

<img src="imgs/downloading-from-github/win_smart_screen_popup.png" alt="Windows SmartScreen warning dialog" width="600">

#### How to Run Anyway

If you trust the source (e.g., you verified the checksum, it's from a legitimate GitHub project):

1. Click the **"More info"** link in the body; this should reveal more options
2. Click **"Run anyway"**

<img src="imgs/downloading-from-github/win_smart_screen_more_info.png" alt="Windows SmartScreen dialog with More info expanded showing Run anyway button" width="600">

**Note:** You only need to do this once. After the first run, Windows remembers and won't warn you again.

### First Time on macOS: Gatekeeper Warning

macOS will block apps from "unidentified developers" (i.e., developers who haven't paid for an Apple Developer certificate). You'll see a warning that the app "can't be opened" or is "from an unidentified developer."

#### How to Run Anyway

If you trust the source (e.g., you verified the checksum, it's from a legitimate GitHub project):

1. **Right-click** (or Control-click) the `.app` file and select **"Open"**
2. macOS will warn the app is from an unidentified developer.
	- <img src="imgs/downloading-from-github/macos_apple_couldnt_verify_popup.png" alt="macOS unidentified developer warning popup" width="200">
3. Click the **question mark** icon in the upper-right of the prompt if you'd like more info from Apple on the topic.
	- <img src="imgs/downloading-from-github/macos_apple_couldnt_verify_popup_q_mark_circled.png" alt="macOS warning popup with question mark icon circled" width="200">
	- <img src="imgs/downloading-from-github/macos_apple_couldnt_verify_plus_more_info.png" alt="Apple help page about unverified apps" width="400">
4. Click **"Done"** to dismiss the prompt.
5. Open **System Settings** → **Privacy & Security**, and scroll down to the **Security** section. You'll see a message that the app was blocked to protect your Mac.
	- <img src="imgs/downloading-from-github/macos_settings_security_app_was_blocked_open_anyway.png" alt="macOS System Settings showing app was blocked with Open Anyway button" width="400">
6. Click **"Open Anyway"**; enter your password if prompted.
	- <img src="imgs/downloading-from-github/macos_open_anyway_prompt.png" alt="macOS Open Anyway confirmation prompt" width="200">
7. The app should now run normally. It should not prompt you again on subsequent launches unless you download a new version.

If the app asks for permission to access folders (like Documents), click **"Allow"** if you're comfortable with it—some apps store their working files there.

---

## Troubleshooting

### "The program can't start because [something].dll is missing" (Windows)

- You may have moved only the `.exe` file instead of the whole folder
- **Solution:** Move the entire extracted folder, keeping all files together

### "Windows protected your PC" won't let me run it at all

- Some security settings block all unrecognized programs
- **Solution:** Check with your IT department or adjust Windows Defender settings (advanced)

### macOS says the app "is damaged and can't be opened"

- This can happen if macOS quarantines the downloaded file
- **Solution:** Try right-clicking the `.app` and selecting "Open" instead of double-clicking. If that doesn't work, try redownloading and extracting fresh.

### The "Open Anyway" option doesn't appear in macOS System Settings

- The option only appears after you've attempted to open the blocked app
- **Solution:** Try to open the app first (right-click → Open), dismiss the warning, then check System Settings → Privacy & Security

### The program crashes or doesn't work

- Check the GitHub project's **Issues** page - others may have reported the same problem
- Look for system requirements (OS version, dependencies, etc.)
- Try redownloading and extracting fresh

### I can't find the downloaded file

- Check your browser's **Downloads** folder
- Windows: `Ctrl + J` opens your download history in most browsers
- macOS: Open Finder and click **Downloads** in the sidebar, or `Cmd + Option + L` in most browsers opens download history

---

## Updating to a New Version

When a developer releases an update:

1. Download the new version from Releases
2. Extract it to a new folder (or replace the old one)
3. **Back up your settings/data first** if the program stores user data

---

## Summary Checklist

- [ ] Find the project's Releases page
- [ ] Download the appropriate file for your platform
- [ ] (Optional) Verify the checksum
- [ ] Extract the files
- [ ] Run the program (`.exe` on Windows, `.app` on macOS)
- [ ] Click through the security warning if it appears (SmartScreen on Windows, Gatekeeper on macOS)
- [ ] Move the program to a permanent location
- [ ] Create shortcuts as needed

## Video Resources
- [Video - Run Application Blocked by Windows Smart Screen](https://youtu.be/JnQbOfr9rP8)
- [Video - Run App Blocked by macOS Security](https://youtu.be/W70Yxx62Vrc)

