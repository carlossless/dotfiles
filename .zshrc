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

# python
export PATH="$HOME/Library/Python/2.7/bin":$PATH

# xcode
export DEVELOPER_DIR="/Applications/Xcode-beta.app/Contents/Developer"

# nvm
export NVM_DIR="/Users/mindw0rk/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
