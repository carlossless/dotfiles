# get symlinked script directory
SCRIPT_DIR="$(dirname "$(readlink "$HOME/.zshrc")")/zsh"

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs rvm nvm virtualenv)
plugins=(git brew osx sublime screen)
source $ZSH/oh-my-zsh.sh

# ENV
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# PATH
[ -f "/usr/libexec/path_helper" ] && eval `/usr/libexec/path_helper -s`

# iTerm
test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

# travis-ci
[ -f /Users/carlossless/.travis/travis.sh ] && source /Users/carlossless/.travis/travis.sh

# usability
source "$SCRIPT_DIR/key_bindings.zsh"
source "$SCRIPT_DIR/completions.zsh"
source "$SCRIPT_DIR/aliases.zsh"
source "$SCRIPT_DIR/utils.zsh"
source "$SCRIPT_DIR/exports.zsh"


