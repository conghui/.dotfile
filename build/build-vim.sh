#!/bin/bash

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}

./configure --with-features=huge \
  --enable-multibyte \
  --enable-pythoninterp \
  --enable-cscope \
  --prefix=${prefix} && \
  make -j8 && make install

linkName=${INSTALL_ROOT}/vim
[[ -f ${linkName} ]] && rm -f ${linkName}
ln -s ${prefix} ${linkName}
