#!/bin/zsh

# clone prezto repo
git clone --recursive https://github.com/sorin-ionescu/prezto.git 

# make links to setup zsh
FROM=${HOME}/.zshrc
DEST=`pwd`/zshrc.zsh
rm -f ~/.zshrc && ln -s $DEST $FROM
echo "linking $FROM to $DEST"
