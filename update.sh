#!/bin/sh -e

# Symbolic link with force and don't follow existing link
LN="ln -nsf --"

# Full directory path of script
DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

function git_install() {
  REPOSITORY="$1"
  TARGET_DIR="$2"
  if [[ -d "$TARGET_DIR" ]]; then
    echo "$(basename $TARGET_DIR)"
    pushd "$TARGET_DIR" &> /dev/null
    git pull > /dev/null
    git submodule sync > /dev/null
    git submodule update --init > /dev/null
    popd &> /dev/null
  else
    git clone --recursive "$REPOSITORY" "$TARGET_DIR"
    pushd "$TARGET_DIR" &> /dev/null
    popd &> /dev/null
  fi
  sh "$TARGET_DIR"/install.sh
}

# Alphabetical order by directory name
git_install 'https://github.com/spl/bash-config.git'               "$DIR/bash-config"
git_install 'https://github.com/spl/editline-config.git'           "$DIR/editline-config"
git_install 'https://github.com/spl/emacs-config.git'              "$DIR/emacs-config"
git_install 'https://github.com/spl/ghc-config.git'                "$DIR/ghc-config"
git_install 'https://github.com/spl/git-config.git'                "$DIR/git-config"
git_install 'https://github.com/spl/hg-config.git'                 "$DIR/hg-config"
git_install 'https://github.com/spl/tmux-config.git'               "$DIR/tmux-config"
git_install 'https://github.com/spl/vim-config.git'                "$DIR/vim-config"
