#!/bin/bash

# please run this script in the directory that contain this script
#

function link_file()
{
  TRUE="$1"
  SOFT="$2"
  
  echo "linking $TRUE to $SOFT"
  ln -sf $TRUE $SOFT
}

link_file `pwd`/gdb/gdbinit      ${HOME}/.gdbinit
link_file `pwd`/git/gitconfig    ${HOME}/.gitconfig
link_file `pwd`/vim              ${HOME}/.vim
link_file `pwd`/vim/vimrc        ${HOME}/.vimrc
link_file `pwd`/tmux/tmux.conf   ${HOME}/.tmux.conf
link_file `pwd`/zsh/aliases.sh   ${HOME}/.aliases.sh
link_file `pwd`/zsh/vars.sh      ${HOME}/.vars.sh

# install solarized
echo "install solarized"
(cd solarized; zsh install.zsh)

# install zsh
echo "install zsh"
(cd zsh; zsh install.zsh)
