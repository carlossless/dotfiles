# carlossless dotfiles

Currently meant only for personal syncing purposes. Setup is done through the following shell scripts:

## symlink.sh

Creates symlinks for every 'dot' configuration file (eg. `.zshrc`) from wherever this repository repository resides to the user home directory `~/`.

## dependencies.sh

Downloads and installs various command line tools, shell completions, services, daemons and GUI apps.

## settings.sh

Sets environment/OS specific settings that are not file based, currently mostly used with macOS user defaults.
