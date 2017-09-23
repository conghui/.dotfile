#!/bin/bash

set -e

plugins="
  zsh-users/antigen
  conghui/terminal-colors
  bssthu/tunet_py
  powerline/fonts
"

if [[ -z $DOTFILEDIR ]]; then
  echo "Please set DOTFILEDIR. e.g. export DOTFILEDIR=`pwd`"
  exit 1
fi

mkdir -p ${DOTFILEDIR}/bundle

# clone a repo into ${DOTFILEDIR}/bundle if it does not exist. Otherwise, update it.
for repo in $plugins; do
  url="https://github.com/${repo}.git"
  local_dir="${DOTFILEDIR}/bundle/${repo##*/}"

  if [[ ! -d $local_dir ]]; then
    git clone --recursive --depth 1 $url $local_dir
  else
    pushd $local_dir; git pull; popd
  fi
done

# link configurations to $HOME
for f in ${DOTFILEDIR}/config/.[!.]*; do
  lnk=${HOME}/${f##*/}
  rm -f $lnk; ln -s $f $lnk
  echo "linking $lnk ==> $f"
done

echo "installtion complete"
