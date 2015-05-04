#!/bin/bash

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}

./bootstrap.sh --prefix=${prefix} || exit 1
./b2 install variant=release link=shared || exit 1

linkName=${prefix%%_*}
cd ${INSTALL_ROOT} || exit 1
rm -f ${linkName} && ln -s ${packageName} ${linkName} || exit 1
