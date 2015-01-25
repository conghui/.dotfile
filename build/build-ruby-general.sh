#!/bin/bash

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}

ruby ./setup.rb install --prefix=${prefix}

cd ${INSTALL_ROOT}
linkName=${packageName%%-*}
rm -f ${linkName}
ln -s ${packageName} ${linkName}
