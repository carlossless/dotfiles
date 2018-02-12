#!/usr/bin/env bash

set -o errexit
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $(uname) == "Darwin" ]]; then
  source "$SCRIPT_DIR/settings/macos-settings.sh"
fi
