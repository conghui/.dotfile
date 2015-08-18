#!/bin/bash

# Install seplib
#Autowriter error:
#1.  vi sat.l/sawf.l: the second line add: %option main
#2.  flex –l sat.l/sawf.l
#3.  mv lex.yy.c sat.c/sawf.c
#X11 error:
#Copy the following from vostok to the corresponding location
#Cp /usr/lib64/libXaw7.so.7.0.0
#Cp /usr/lib/libXaw7.so.7.0.0
#Cp –r /usr/include/X11/Xaw3d
#Cp –r /usr/include/X11/Xaw

#Qt_cube error:
#Comment out qt_cube in interact/Makefile, and empty /qt_cube

export F90=ifort
export FC=ifort
export F77=ifort
export F95=ifort
export CC=icc
export CXX=icpc

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}
NUM_CORES=${NUM_CORES:-12}

./configure --prefix=${prefix} && \
  make install

linkName=${packageName%%-*}
cd ${INSTALL_ROOT} || exit 1
rm -f ${linkName} && ln -s ${packageName} ${linkName} || exit 1
