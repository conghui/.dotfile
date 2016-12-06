#!/bin/bash

# basic compilers
brew install ruby
brew install perl
brew install python

brew install git
brew install scons
brew install zsh
brew install bwm-ng

# for neovim
hash glibtool &> /dev/null || brew reinstall -s libtool
brew install python3
brew install neovim/neovim/neovim
pip3 install neovim

brew install tmux
brew install direnv
brew install fasd
