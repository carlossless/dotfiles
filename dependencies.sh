#!/usr/bin/env bash

set -o errexit
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $(uname) == "Darwin" ]]; then
  eval "$SCRIPT_DIR/dependencies/macos-deps.sh"
fi

eval "$SCRIPT_DIR/dependencies/shared-deps.sh"
