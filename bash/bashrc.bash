#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Load nested configs
for f in $(find -L ${HOME}/.dotfile/bash -name \*.bash | \
  grep -v bashrc.bash | grep -v bash-it.bash); do
  source $f
done

# Load Bash It
source $BASH_IT/bash_it.sh
