DOTFILE_DIR="$(dirname "$(readlink "$HOME/.zshrc")")"

# dotfiles

dotfiles-open () {
    open "$DOTFILE_DIR"
}

dotfiles-edit () {
    $EDITOR "$DOTFILE_DIR"
}

dotfiles-deps () {
    eval "$DOTFILE_DIR/dependencies.sh"
}

# helper functions

ts2date () {
  perl -e "print scalar localtime($1 / 1000)"
}
