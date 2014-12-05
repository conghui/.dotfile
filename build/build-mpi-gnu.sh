#!/bin/bash

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}-gnu

./configure --prefix=${prefix} CC=gcc CXX=g++ FC=gfortran \
  --enable-g=dbg,mem,meminit \
  CPPFLAGS=-I${INSTALL_ROOT}/valgrind/include && \
  make -j12 && \
  make install
