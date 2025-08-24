#!/bin/bash

# Fix all filenames with ? in them using git mv
find . -name "*\?*" -type f | while read -r file; do
    # Extract the part before the first ?
    newname=$(echo "$file" | sed 's/?.*$//')
    
    # Only rename if the new name is different and doesn't already exist
    if [ "$file" != "$newname" ] && [ ! -e "$newname" ]; then
        echo "Git moving: '$file' -> '$newname'"
        git mv "$file" "$newname"
    else
        echo "Skipping: '$file' (target exists or same name)"
    fi
done

echo "Done renaming files!"