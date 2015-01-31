#!/bin/zsh

# clone prezto repo
git clone --recursive https://github.com/sorin-ionescu/prezto.git zprezto
ln -sf `pwd`/zprezto ~/.zprezto
setopt EXTENDED_GLOB
for rcfile in ${HOME}/.dotfile/zsh/zprezto/runcoms/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
rm -f ~/.zpreztorc && ln -s `pwd`/zpreztorc ~/.zpreztorc

# make links to setup zsh
FROM=${HOME}/.zshrc
DEST=`pwd`/zshrc.zsh
rm -f ~/.zshrc && ln -s $DEST $FROM
echo "linking $FROM to $DEST"
