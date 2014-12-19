#!/bin/bash

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}

./configure --prefix=${prefix} && \
  make -j12 && \
  make install

cd ${INSTALL_ROOT}
linkName=${packageName%%-*}
rm -f ${linkName}
ln -s ${packageName} ${linkName}
