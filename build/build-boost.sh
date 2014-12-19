#!/bin/bash

packageName=${PWD##*/}
./bootstrap.sh --prefix=${INSTALL_ROOT}/${packageName}

./b2 install variant=release link=shared

linkName=${prefix%%-*}
[[ -f ${linkName} ]] && rm -f ${linkName}
ln -s ${prefix} ${linkName}
