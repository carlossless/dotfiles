# gnupg tty
export GPG_TTY=$(tty)

# editor
export EDITOR="vim"

# user bin
export PATH="$HOME/bin:$PATH"

# python
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# xcode
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"

# go
export GOPATH="$HOME/Projects/go"
export PATH="$GOPATH/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# rvm
export PATH="$PATH:$HOME/.rvm/bin"

# perl5
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# gettext
export PATH="/usr/local/opt/gettext/bin:$PATH"
