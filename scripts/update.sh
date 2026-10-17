#!/usr/bin/env bash

set -euxo pipefail

VERSION="$1"
git fetch-file add https://github.com/CrowdHailer/eyg-lang.git packages --branch "gleam_cli-v$VERSION" --force
git fetch-file pull --force
scripts/gleam2nix.py
nix build
result/bin/eyg eval -c '@standard'
jj tag set "v$VERSION"
