#!/bin/bash

# cd to current folder
cd .
echo "Current repository folder"
echo $(pwd)

# Fetch the latest information from the remote repository
git fetch -p

# Loop through all local branches
for branch in $(git branch --format="%(refname:short)"); do
  # Check if the branch has a corresponding remote branch
  # if ! git branch -r | grep -q "origin/$branch"; then
  if ! git rev-parse --quiet --verify origin/$branch >/dev/null; then
    # Echo the branch name
    # TODO: preview mode
    # echo "Deleting branch: $branch"

    # Delete the local branch
    git branch -D $branch
  fi
done
