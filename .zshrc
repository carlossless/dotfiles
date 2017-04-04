### oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git brew osx sublime screen)
source $ZSH/oh-my-zsh.sh

### ENV
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

### Key Bindings
##Keypad
#0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
#1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
#4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
#7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
#+ -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

##Alt-Word Traversing
bindkey "[C" forward-word
bindkey "[D" backward-word

### PATH
# base path
eval `/usr/libexec/path_helper -s`

# heroku
export PATH="/usr/local/heroku/bin:$PATH"

# travis-ci
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# golang
export GOPATH=~/.gocode
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

### Exports
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"

### Completions
source /usr/local/share/zsh/site-functions
fpath=(/usr/local/share/zsh-completions $fpath)

### Aliases

# zsh
alias reload-zsh="source ~/.zshrc"

# git
alias git=hub

# swift
alias swift="/usr/bin/env xcrun swift"

# xcode
alias symbolicate="/Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash -v"
