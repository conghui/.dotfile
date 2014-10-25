#!/bin/bash

version="2.1.3"
name="ruby"
prefix=${HOME}/vroot/local/${name}-${version}

./configure --prefix=${prefix} && \
  make -j8 && make install
