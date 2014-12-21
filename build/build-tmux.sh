#!/bin/bash

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}

libeventRoot=${INSTALL_ROOT}/libevent

if [[ ! -e $libeventRoot ]]; then
  echo "${libeventRoot} doesn't exist"
  echo "please install libevent first"
  exit -1
fi

LDFLAGS="-L${libeventRoot}/lib -Wl,-rpath=${libeventRoot}/lib" \
CPPFLAGS="-I${libeventRoot}/include" \
  ./configure --prefix=${prefix} && \
  make -j12 && \
  make install

cd ${INSTALL_ROOT}
linkName=${packageName%%-*}
rm -f ${linkName}
ln -s ${packageName} ${linkName}
