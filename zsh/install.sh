#!/bin/zsh

(cd ..; ./makelink.sh)

# make links to setup zsh
FROM=${HOME}/.zshrc
DEST=`pwd`/zshrc.zsh
rm -f ~/.zshrc && ln -s $DEST $FROM
echo "linking $FROM to $DEST"
