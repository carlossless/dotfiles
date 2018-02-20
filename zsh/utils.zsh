# helper functions

ts2date () {
  perl -e "print scalar localtime($1 / 1000)"
}
