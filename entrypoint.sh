#!/bin/bash
set -euo pipefail

echo "==================="

git config --global user.name "${INPUT_NAME:-${GITHUB_ACTOR:-github-actions}}"
git config --global user.email "${INPUT_EMAIL:-${GITHUB_ACTOR:-github-actions}@localhost}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git add -A
if ! git diff --cached --quiet; then
	git commit -m "Update Feed"
	git push origin "HEAD:${GITHUB_REF_NAME:-main}"
fi

echo "==================="
