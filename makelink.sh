#!/bin/bash

LINKFILES="\
  gdbinit gitconfig gitexcludes \
  vars.sh aliases.sh
  "

BASEDIR=$(dirname $0)

for f in $LINKFILES; do
  DEST=`readlink -f $f`
  FROM=${HOME}/.${f}
  ln -sf ${DEST} ${FROM}
done
