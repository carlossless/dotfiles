# helper functions

alias ssh2chip="ssh chip@carlossless-chip.local"

ts2date () {
  perl -e "print scalar localtime($1 / 1000)"
}
