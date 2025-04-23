#!/bin/bash

# Set date format and output file
DATE=$(date +'%Y-%m-%d')
VERSION=${1:-"Unreleased"}
FILE=CHANGELOG.md

# Write header if it doesn't exist
if [ ! -f "$FILE" ]; then
  echo -e "# Changelog\n\nAll notable changes will be documented in this file.\n" > "$FILE"
fi

# Append the latest changes
{
  echo -e "## [$VERSION] - $DATE\n"
  git log --pretty=format:"- %s (%h)" $(git describe --tags --abbrev=0)..HEAD
  echo -e "\n"
} >> "$FILE"