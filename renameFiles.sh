#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <toReplace> <replaceWith>"
    exit 1
fi

# Assign the command line arguments to variables
toReplace="$1"
replaceWith="$2"

# Iterate through the files in the current directory
for file in *; do
    # Check if the filename contains the 'toReplace' string anywhere
    if [[ "$file" == *"$toReplace"* ]]; then
        # Replace 'toReplace' with 'replaceWith' in the filename
        newFile="${file//$toReplace/$replaceWith}"

        # Rename the file
        mv "$file" "$newFile"
        echo "Renamed: $file -> $newFile"
    fi
done

echo "Rename operation complete."