#!/bin/bash

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}

./bootstrap.sh --prefix=${prefix}
./b2 install variant=release link=shared

cd ${INSTALL_ROOT}
linkName=${prefix%%_*}
rm -f ${linkName}
ln -s ${packageName} ${linkName}
