# zsh
alias reload-zsh="source ~/.zshrc"

# git
alias git=hub

# swift
alias swift="/usr/bin/env xcrun swift"

# xcode
alias symbolicate="/Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash -v"

# rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# iterm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'

