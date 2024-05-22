# carlossless dotfiles

I have moved all of my configs into [nix](https://nixos.org/) ([NixOS](https://nixos.org/), [nix-darwin](https://github.com/LnL7/nix-darwin), [home-manager](https://github.com/nix-community/home-manager)) and store them privately for now. I might open them up one day.

This repository has been deprecated and archived.

---

Currently meant only for personal syncing purposes. Setup is done through the following shell scripts:

## symlink.sh

Creates symlinks for every 'dot' configuration file (eg. `.zshrc`) from wherever this repository resides to the user home directory `~/`.

## dependencies.sh

Downloads and installs various command line tools, shell completions, services, daemons and GUI apps.

## settings.sh

Sets environment/OS specific settings that are not file based, currently mostly used with macOS user defaults.
