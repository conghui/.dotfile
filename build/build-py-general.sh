#!/bin/bash

packageName=${PWD##*/}          
prefix=${INSTALL_ROOT}/${packageName}

python2.7 ./setup.py install --prefix=${prefix}
