#!/bin/sh

set -ue

version_lte() {
  [ "$1" = "$2" ] && return 1 || printf '%s\n' "$1" "$2" | sort -c -V
}

git config --global --add safe.directory /github/workspace

cd /github/workspace

PathToVersion="${INPUT_VERSION_PATH}"
CurrentVersion="$(jq -r .version ./${PathToVersion})"

git checkout main
git pull origin main

MainVersion="$(jq -r .version ./${PathToVersion})"

echo $MainVersion
echo $CurrentVersion

version_lte "${MainVersion}" "${CurrentVersion}" && exit 0 || exit 1
