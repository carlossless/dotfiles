_DOTFILE_DIR="$(dirname "$(readlink "$HOME/.zshrc")")"

# dotfiles

dotfiles-open () {
  open "$_DOTFILE_DIR"
}

dotfiles-edit () {
  ${=EDITOR} "$_DOTFILE_DIR"
}

dotfiles-deps () {
  eval "$_DOTFILE_DIR/dependencies.sh"
}

# vscode
vscode-backup-extensions () {
  code --list-extensions > "$_DOTFILE_DIR/editors/vscode/extensions"
}

vscode-restore-extensions () {
  cat "$_DOTFILE_DIR/editors/vscode/extensions" | xargs -L 1 code --install-extension
}

# antibody
antibody-update () {
  antibody bundle < "$_DOTFILE_DIR/zsh/.zsh_plugins.txt" > "$_DOTFILE_DIR/zsh/.zsh_plugins.sh"
}

# helper functions

ts2date () {
  perl -e "print scalar localtime($1 / 1000)"
}

clip-key () {
  cat $HOME/.ssh/id_rsa.pub | pbcopy
}

# git

git-replace-email () {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo 'Wrong arguments supplied'
    return 1
  fi
  git filter-branch -f --env-filter '
  OLD_EMAIL="$1"
  CORRECT_NAME="Your Correct Name"
  CORRECT_EMAIL="$2"
  if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
  then
      export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
  fi
  if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
  then
      export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
  fi
  ' --tag-name-filter cat -- --branches --tags
}
