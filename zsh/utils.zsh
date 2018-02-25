_DOTFILE_DIR="$(dirname "$(readlink "$HOME/.zshrc")")"

# dotfiles

dotfiles-open () {
    open "$_DOTFILE_DIR"
}

dotfiles-edit () {
    $EDITOR "$_DOTFILE_DIR"
}

dotfiles-deps () {
    eval "$_DOTFILE_DIR/dependencies.sh"
}

# helper functions

ts2date () {
  perl -e "print scalar localtime($1 / 1000)"
}
