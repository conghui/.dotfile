#!/bin/bash

plugins="base dirs git ssh todo"
aliases="general git vim todo.txt-cli"
completion="bash-it defaults git ssh todo"

# create an directory for enabled plugins/aliases/completion
plugins_dir="~/.bash_it/plugins/enabled"
aliases_dir="~/.bash_it/aliases/enabled"
completion_dir="~/.bash_it/completion/enabled"

rm -rf $plugins_dir; mkdir -p $plugins_dir
rm -rf $aliases_dir; mkdir -p $aliases_dir
rm -rf $completion_dir; mkdir -p $completion_dir


# enable the above plugins
for p in $plugins; do
  pname=${p}.plugin.bash
  linkdest=${HOME}/.bash_it/plugins/available/${pname}
  linkfrom=${HOME}/.bash_it/plugins/enabled/${pname}
  if [[ -f $linkdest ]]; then
    ln -sf $linkdest $linkfrom
  fi
done

# enable the above aliases
for p in $aliases; do
  pname=${p}.aliases.bash
  linkdest=${HOME}/.bash_it/aliases/available/${pname}
  linkfrom=${HOME}/.bash_it/aliases/enabled/${pname}
  if [[ -f $linkdest ]]; then
    ln -sf $linkdest $linkfrom
  fi
done

# enable the above completion
for p in $completion; do
  pname=${p}.completion.bash
  linkdest=${HOME}/.bash_it/completion/available/${pname}
  linkfrom=${HOME}/.bash_it/completion/enabled/${pname}
  #echo $linkdest $linkfrom
  if [[ -f $linkdest ]]; then
    ln -sf $linkdest $linkfrom
  fi
done
