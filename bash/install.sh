#!/bin/bash

# download bash-it
git clone https://github.com/revans/bash-it.git ~/.bash_it

# install bash-it
echo "no matter what kind of plugins/aliases/completions you select,"
echo "it will be overwritten by ~/.dotfile/bash/bash-it.bash"
echo "you can enable what you want in ~/.dotfile/bash/bashrc.bash"
echo 

if [[ -f ${HOME}/.bash_profile ]]; then
  mv ${HOME}/.bash_profile ${HOME}/.bash_profile.bk
fi

bash_install="${HOME}/.bash_it/install.sh"
if [[ -f $bash_install ]]; then
  $bash_install
else
  echo "install script doesn't exist"
  exit 1
fi

# enable aliases, plugins, completions
bashitscript="${HOME}/.dotfile/bash/bash-it.bash"
[[ -f ${bashitscript} ]] && source ${bashitscript}

# make link for bashrc
rm -f ~/.bash_profile 
[[ -f ~/.bashrc ]] && mv ~/.bashrc ~/.bashrc.bk 

dest="`pwd`/bashrc.bash"
if [[ -f $dest ]]; then
  echo "linking ~/.bashrc to $dest"
  ln -sf $dest ~/.bashrc

  echo "linking ~/.bash_profile to $dest"
  ln -sf $dest ~/.bash_profile

  echo "Installation done, please source ~/.bashrc"
else
  echo "file $dest doesn't exist, installtion failed"
fi

