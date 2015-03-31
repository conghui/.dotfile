#!/bin/zsh

# make links to setup zsh
FROM=${HOME}/.ssh
DEST=${HOME}/.dotfile/ssh

mkdir -p ${FROM}
ln -sf ${DEST}/* ${FROM}/

chmod 700 $DEST
chmod 600 ${DEST}/*
