#!/bin/bash

DOTFILEDIR=${HOME}/.dotfile

mkdir -p ${DOTFILEDIR}/bundle

# clone repos into ${DOTFILEDIR}/bundle
pushd ${DOTFILEDIR}/bundle
git clone --recursive https://github.com/zsh-users/antigen.git
git clone --recursive https://github.com/tmux-plugins/tmux-yank.git
git clone --recursive https://github.com/coolwanglu/guake-colors-solarized.git
git clone --recursive https://github.com/conghui/iterm2-color-solarized.git
git clone --recursive https://github.com/Anthony25/gnome-terminal-colors-solarized.git
git clone --recursive https://github.com/ghuntley/terminator-solarized.git
git clone --recursive https://github.com/bssthu/tunet_py.git
git clone --recursive https://github.com/powerline/fonts.git
popd

# dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ${DOTFILEDIR}/bundle && rm -rf installer.sh

# link configurations to $HOME
for f in ${DOTFILEDIR}/config/.[!.]*; do
  lnk=${HOME}/${f##*/}
  rm -f $lnk
  ln -s $f $lnk
  echo "linking $lnk ==> $f"
done

echo "installtion complete"
