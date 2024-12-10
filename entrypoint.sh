#!/bin/sh

set -ue

version_lte() {
  printf '%s\n' "$1" "$2" | sort -C -V
}

ls -alh /github/workspace

PathToVersion="${INPUT_VERSION_PATH}"
CurrentVersion="$(jq -r .version /${PathToVersion})"

git checkout main

MainVersion="$(jq -r .version /${PathToVersion})"

version_lte "${MainVersion}" "${PathToVersion}"
