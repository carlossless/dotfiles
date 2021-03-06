#!/usr/bin/env bash

set -euo pipefail

sudo apt-get update
sudo apt-get install git vim i3

# hub
git clone https://github.com/github/hub.git && cd hub
script/build -o ~/bin/hub

exit 0
