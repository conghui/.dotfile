#!/bin/bash

packageName=${PWD##*/}-gnu
prefix=${INSTALL_ROOT}/${packageName}

./configure --prefix=${prefix} CC=gcc CXX=g++ FC=gfortran \
  --enable-g=dbg,mem,meminit \
  CPPFLAGS=-I${INSTALL_ROOT}/valgrind/include && \
  make -j12 && \
  make install

cd ${INSTALL_ROOT}
linkName=${INSTALL_ROOT}/mpi
rm -f ${linkName}
ln -s ${packageName} ${linkName}
