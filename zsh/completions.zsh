source /usr/local/share/zsh/site-functions
fpath=(/usr/local/share/zsh-completions $fpath)

# GCloud
[ -f '/Users/carlossless/.google-cloud-sdk/path.zsh.inc' ] && source "$HOME/.google-cloud-sdk/path.zsh.inc"
[ -f '/Users/carlossless/.google-cloud-sdk/completion.zsh.inc' ] && source "$HOME/.google-cloud-sdk/completion.zsh.inc"

# Jabba
[ -s "/Users/carlossless/.jabba/jabba.sh" ] && source "/Users/carlossless/.jabba/jabba.sh"
