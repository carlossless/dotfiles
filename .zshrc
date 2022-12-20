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
if ! [ -f "$SCRIPT_DIR/zsh_plugins.zsh" ]; then
  source "$HOME/.zsh_plugins.sh"
else
  echo "WARNING: $HOME/.zsh_plugins.sh not found - run antibody-update"
fi

source "$SCRIPT_DIR/key_bindings.zsh"
source "$SCRIPT_DIR/aliases.zsh"
source "$SCRIPT_DIR/utils.zsh"

# untested, staged shell configs
! [ -f "$SCRIPT_DIR/staged.zsh" ] || source "$SCRIPT_DIR/staged.zsh"

# starship
eval "$(starship init zsh)"

# start direnv
eval "$(direnv hook zsh)"

# nix
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then . "$HOME/.nix-profile/etc/profile.d/nix.sh"; fi

source "$(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
