#!/bin/bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlinks

ln -sfv "$DOTFILES_DIR/bash/bash_profile" ~
ln -sfv "$DOTFILES_DIR/git/gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/gitignore_global" ~
ln -sfv "$DOTFILES_DIR/vim/vimrc" ~

# Package managers & packages

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/node.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"
. "$DOTFILES_DIR/install/ruby.sh"
