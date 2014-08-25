#!/bin/bash

# please run this script in the directory that contain this script
#

LINKFILES="\
  gdbinit gitconfig gitexcludes \
  vars.sh aliases.sh
  "

for f in $LINKFILES; do
  DEST="`pwd`/$f"
  FROM=${HOME}/.${f}
  if [[ -f $DEST ]]; then
    echo "linking $FROM to $DEST"
    ln -sf ${DEST} ${FROM}
  fi
done
