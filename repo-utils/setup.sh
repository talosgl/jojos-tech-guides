#!/bin/sh
# navigate to the repo root first 
cd "$(git rev-parse --show-toplevel)" || exit 1
# set up githooks
git config core.hooksPath .githooks
echo "Git hooks configured."
