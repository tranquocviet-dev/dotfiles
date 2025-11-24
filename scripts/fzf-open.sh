#!/bin/bash

# Define the command to use (e.g., vim, less, cat)
COMMAND="nvim"

# Find files in the current directory and subdirectories, then pipe to fzf
selected_file=$(sk --margin 10% --color="bw")

# Check if a file was selected
if [[ -n "$selected_file" ]]; then
    # Execute the command with the selected file
    "$COMMAND" "$selected_file"
else
    echo "No file selected."
fi
