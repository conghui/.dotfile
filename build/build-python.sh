#!/bin/bash

./configure --prefix=${HOME}/vroot/local/Python-2.7.8 --enable-shared && \
  make -j8 && make install
