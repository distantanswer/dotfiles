#!/bin/bash

# Define paths
ahk_folder="$HOME/.config/auto-hotkey"
windows_user=$(wslvar USERPROFILE | sed 's|C:\\Users\\||')
windows_startup="/mnt/c/Users/$windows_user/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

# Check if the AHK folder exists
if [ ! -d "$ahk_folder" ]; then
  echo "Error: AHK folder $ahk_folder does not exist."
  exit 1
fi

# Remove broken links from the Windows Startup folder
for link in "$windows_startup"/*.ahk; do
  if [ -L "$link" ] && [ ! -e "$link" ]; then
    rm "$link"
    echo "Removed broken link $link"
  fi
done

# Loop through all .ahk files in the AHK folder
for ahk_file in "$ahk_folder"/*.ahk; do
  # Get the basename of each AHK file
  ahk_filename=$(basename "$ahk_file")
  
  # Set the path for the link in the Windows Startup folder
  link_path="$windows_startup/$ahk_filename"

  # Create the symbolic link if it doesn't already exist
  if [ ! -L "$link_path" ]; then
    ln -s "$ahk_file" "$link_path"
    echo "Linked $ahk_file to $link_path"
  else
    echo "Link for $ahk_filename already exists in Windows Startup."
  fi
done

echo "Script completed."

