#!/bin/bash

packageName=${PWD##*/}          
prefix=${INSTALL_ROOT}/${packageName}

./configure --prefix=${prefix} && \
  make -j12 && \
  make install
