#!/bin/bash

# Install caskroom

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages

apps=(
  firefox
  google-chrome
  slack
  dropbox
  sublime-text
  iterm2
  cyberduck
  spectacle
  virtualbox
  vlc
  spotify
)

brew cask install "${apps[@]}"
