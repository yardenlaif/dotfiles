#!/bin/bash

is_valid_json() {
    echo "$1" | jq empty >/dev/null 2>&1
}

# Get the command to run from the first argument
command_to_run="$1"

# Check if a command is provided
if [ -z "$command_to_run" ]; then
    echo "Error: No command provided. Please specify a command to run, e.g., './script.sh jless -' or './script.sh vd -f json -'."
    exit 1
fi

# Get clipboard content
clipboard_content=$(xclip -o -selection clipboard)

# Check if the clipboard content is valid JSON
if is_valid_json "$clipboard_content"; then
    # If valid, run the provided command
    echo "$clipboard_content" | $command_to_run
else
    # If not valid, apply sed transformations
    transformed_content=$(echo "$clipboard_content" | sed 's/\"\"/\"/g; s/^\"//g; s/^\}\"$/\}/g')

    # Check if the transformed content is valid JSON
    if is_valid_json "$transformed_content"; then
        # If valid, run the provided command
        echo "$transformed_content" | $command_to_run
    else
        # If still not valid, exit the script
        echo "Error: Clipboard content is not valid JSON, even after transformation."
        exit 1
    fi
fi
