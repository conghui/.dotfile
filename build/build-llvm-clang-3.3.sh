#!/bin/bash

# please make sure that you are in the directory named:
# llvm-clang-compileRT-3.3/build

version=3.3
packageName="llvm-${version}"
source_code_dir=../
num_cores=`grep -c '^processor' /proc/cpuinfo`

../configure --prefix=${INSTALL_ROOT}/${packageName} --enable-optimized || exit 1
make -j${num_cores} || exit 1
make install || exit 1

linkName=${packageName%%-*}
cd ${INSTALL_ROOT} || exit 1
rm -f ${linkName} && ln -s ${packageName} ${linkName} || exit 1
