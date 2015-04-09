#!/bin/zsh

# clone required repo
git clone git@github.com:seebi/dircolors-solarized.git dircolors
git clone git@github.com:Anthony25/gnome-terminal-colors-solarized.git gnome

rm -rf ~/.config/terminator/config && \
  ln -sf ~/.dotfile/solarized/terminator/config ~/.config/terminator/config
