#!/bin/bash

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}
NUM_CORES=${NUM_CORES:-12}

./configure --prefix=${prefix} && \
  make -j${NUM_CORES} && \
  make install

linkName=${packageName%%-*}
cd ${INSTALL_ROOT} || exit 1
rm -f ${linkName} && ln -s ${packageName} ${linkName} || exit 1
