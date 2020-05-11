source /usr/local/share/zsh/site-functions
fpath=(/usr/local/share/zsh-completions $fpath)

# GCloud
[ -f "$HOME/.google-cloud-sdk/path.zsh.inc" ] && source "$HOME/.google-cloud-sdk/path.zsh.inc"
[ -f "$HOME/.google-cloud-sdk/completion.zsh.inc" ] && source "$HOME/.google-cloud-sdk/completion.zsh.inc"

# Jabba
[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"
