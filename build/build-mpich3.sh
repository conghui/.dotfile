#!/bin/bash

version="3.1.3"

export CC=icc
export CXX=icpc
prefix=${HOME}/vroot/local/mpich-${version}

./configure --prefix=${prefix} && \
  make -j8 && make install
