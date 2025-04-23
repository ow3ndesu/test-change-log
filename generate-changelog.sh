#!/bin/bash

DATE=$(date +'%Y-%m-%d')
VERSION=${1:-"Unreleased"}
FILE=CHANGELOG.md

# Write header if it doesn't exist
if [ ! -f "$FILE" ]; then
  echo -e "# Changelog\n\nAll notable changes will be documented in this file.\n" > "$FILE"
fi

# Get the latest tag, or use empty string if no tags exist
LATEST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")

# Set the commit range
if [ -z "$LATEST_TAG" ]; then
  RANGE=""
else
  RANGE="$LATEST_TAG..HEAD"
fi

# Append changes
{
  echo -e "## [$VERSION] - $DATE\n"
  git log --pretty=format:"- %s (%h)" $RANGE
  echo -e "\n"
} >> "$FILE"
