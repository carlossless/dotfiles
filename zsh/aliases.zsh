# zsh
alias zsh-reload="source ~/.zshrc"

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

# dad jokes
alias dad='cowsay "$(curl -sL -H "Accept: text/plain" icanhazdadjoke.com)"'

alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'

