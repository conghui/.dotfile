#!/bin/bash

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}

python2.7 ./setup.py install --prefix=${prefix}

linkName=${packageName%%-*}
cd ${INSTALL_ROOT} || exit 1
rm -f ${linkName} && ln -s ${packageName} ${linkName} || exit 1
