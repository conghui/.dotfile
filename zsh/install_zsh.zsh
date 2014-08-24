#!/bin/zsh

# clone git@github.com:robbyrussell/oh-my-zsh.git
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

# make links to setup zsh
rm -f ~/.zsh && ln -s `pwd` ~/.zsh
rm -f ~/.zshrc && ln -s `pwd`/zshrc.zsh ~/.zshrc

echo "Installation done"
