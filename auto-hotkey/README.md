# AHK Auto-Linker Script

This script automates the process of linking AutoHotkey (.ahk) files from your WSL Ubuntu environment to your Windows startup folder, ensuring that your AutoHotkey scripts are automatically executed when Windows starts.

## Purpose

- Manage your AutoHotkey scripts from within your WSL Ubuntu environment (typically stored in `~/.config/auto-hotkey/`).
- Automatically create symbolic links to these scripts in the Windows Startup folder, allowing them to execute when you log in to Windows.
- The script ensures that no duplicate links are created and removes any broken links to keep your startup folder clean.

## How It Works

1. The script checks the `~/.config/auto-hotkey/` folder for `.ahk` files.
2. It creates symbolic links in the Windows startup folder:  
   `C:\Users\<YourUsername>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
3. If the link already exists, it skips creating a duplicate.
4. Any broken links in the Windows startup folder are automatically removed.

## Usage

1. Clone your configuration files, including this script, into your WSL environment.
2. Run the script in your WSL terminal:
   ```bash
   ./sync-wsl-with-windows.sh
    ```
3. Your AutoHotkey scripts will now be linked to the Windows startup folder and automatically run when you log in.
