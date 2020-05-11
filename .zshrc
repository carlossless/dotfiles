# get symlinked script directory
SCRIPT_DIR="$(dirname "$(readlink "$HOME/.zshrc")")/zsh"

# starship
eval "$(starship init zsh)"

# ENV
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# setup PATH
[ -f "/usr/libexec/path_helper" ] && eval `/usr/libexec/path_helper -s`

# iTerm
test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

# config
source "$SCRIPT_DIR/key_bindings.zsh"
source "$SCRIPT_DIR/completions.zsh"
source "$SCRIPT_DIR/aliases.zsh"
source "$SCRIPT_DIR/utils.zsh"
source "$SCRIPT_DIR/exports.zsh"

# untested, staged shell configs
! [ -f "$SCRIPT_DIR/staged.zsh" ] || source "$SCRIPT_DIR/staged.zsh"
