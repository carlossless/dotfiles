# get symlinked script directory
SCRIPT_DIR="$(dirname "$(readlink "$HOME/.zshrc")")/zsh"

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git brew osx sublime screen)
source $ZSH/oh-my-zsh.sh

# ENV
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# PATH
eval `/usr/libexec/path_helper -s`

# usability
source "$SCRIPT_DIR/key_bindings.zsh"
source "$SCRIPT_DIR/completions.zsh"
source "$SCRIPT_DIR/aliases.zsh"
source "$SCRIPT_DIR/utils.zsh"
source "$SCRIPT_DIR/local.zsh"
