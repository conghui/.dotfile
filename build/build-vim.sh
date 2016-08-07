#!/bin/bash

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}

./configure --with-features=huge \
  --enable-multibyte \
  --enable-pythoninterp \
  --enable-luainterp \
  --enable-cscope \
  --prefix=${prefix} && \
  make -j8 && make install

cd ${INSTALL_ROOT}
linkName=${INSTALL_ROOT}/vim
rm -f ${linkName}
ln -s ${packageName} ${linkName}
