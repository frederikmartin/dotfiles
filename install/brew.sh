#!/bin/bash

# Install homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew update
brew upgrade

# Install packages

apps=(
  git
  python
  vim
  wget
)

brew install "${apps[@]}"
