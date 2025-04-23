#!/bin/bash

echo "## [Unreleased] - $(date +'%Y-%m-%d')" > CHANGELOG.md
echo "" >> CHANGELOG.md

# List all commits since last tag (or all if no tags exist)
git log --pretty=format:"- %s (%an)" >> CHANGELOG.md