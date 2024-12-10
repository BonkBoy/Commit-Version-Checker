#!/bin/sh

set -ue

version_lte() {
  printf '%s\n' "$1" "$2" | sort -c -V
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

echo $(version_lte "${MainVersion}" "${PathToVersion}")

echo $VersionCheck
