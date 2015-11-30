#!/bin/bash

# Use n as version management for node

brew install n

n stable

# Install node packages (global)

packages=(
  gulp
  nodemon
)

npm install -g "${packages[@]}"
