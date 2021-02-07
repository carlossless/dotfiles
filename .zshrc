# get symlinked script directory
SCRIPT_DIR="$(dirname "$(readlink "$HOME/.zshrc")")/zsh"

# LANG
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# zsh config
bindkey -v # vi mode
setopt no_beep
setopt auto_cd
export HISTSIZE=10000
export SAVEHIST=10000
setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history

source "$SCRIPT_DIR/exports.zsh"

# win title (starship)
function set_win_title(){
    echo -ne "\033]0; $PWD \007"
}
precmd_functions+=(set_win_title)

# starship
export STARSHIP_CONFIG=~/.starship
eval "$(starship init zsh)"

# setup PATH
[ -f "/usr/libexec/path_helper" ] && eval `/usr/libexec/path_helper -s`

# init completions
zstyle ':completion:*' menu select

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit

# iTerm
test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

# plugin options
export SHOW_AWS_PROMPT=false
export NVM_LAZY_LOAD=true

# antibody
source "$SCRIPT_DIR/.zsh_plugins.sh"

source "$SCRIPT_DIR/key_bindings.zsh"
source "$SCRIPT_DIR/aliases.zsh"
source "$SCRIPT_DIR/utils.zsh"

# untested, staged shell configs
! [ -f "$SCRIPT_DIR/staged.zsh" ] || source "$SCRIPT_DIR/staged.zsh"
