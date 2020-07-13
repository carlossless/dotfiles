# get symlinked script directory
SCRIPT_DIR="$(dirname "$(readlink "$HOME/.zshrc")")/zsh"

# win title (starship)
function set_win_title(){
    echo -ne "\033]0; $PWD \007"
}
precmd_functions+=(set_win_title)

# starship
export STARSHIP_CONFIG=~/.starship
eval "$(starship init zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# history-substring-search
[ -f /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# ENV
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# setup PATH
[ -f "/usr/libexec/path_helper" ] && eval `/usr/libexec/path_helper -s`

# iTerm
test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

# zplug
# source ~/.zplug/init.zsh
# zplug "Tarrasch/zsh-autoenv"
# zplug load

# source $(brew --prefix autoenv)/activate.sh

source "$SCRIPT_DIR/key_bindings.zsh"
source "$SCRIPT_DIR/completions.zsh"
source "$SCRIPT_DIR/aliases.zsh"
source "$SCRIPT_DIR/utils.zsh"
source "$SCRIPT_DIR/exports.zsh"

# untested, staged shell configs
! [ -f "$SCRIPT_DIR/staged.zsh" ] || source "$SCRIPT_DIR/staged.zsh"
if [ -e /home/carlossless/.nix-profile/etc/profile.d/nix.sh ]; then . /home/carlossless/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export IDF_PATH="$HOME/Projects/esp/esp-idf"

alias loadidf='. ~/Projects/esp/esp-idf/export.sh'
