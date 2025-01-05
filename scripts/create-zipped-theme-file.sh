#! /usr/bin/bash

# Summary: Use files from parent folder to created zipped Ghost Theme (excluding .git*, *.lock, any ".vs" folder and the script's folder).

FILE_TO_CREATE=~/Downloads/casper-custom.zip

# Get the directory containing the script
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Get the relative path of the script folder
SCRIPT_FOLDER_REL="./$(basename "$SCRIPT_DIR")"

# Change to the parent directory of the script
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
cd "$PARENT_DIR"

# Create the zip archive while preserving the folder structure relative to the parent directory
rm "$FILE_TO_CREATE"
zip -r "$FILE_TO_CREATE" . -x "./.git*" "./*.lock" "$SCRIPT_FOLDER_REL/*" "*/.vs/*"
