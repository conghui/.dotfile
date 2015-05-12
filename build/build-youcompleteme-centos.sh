#!/bin/bash

llvm_root_dir=${INSTALL_ROOT}/llvm
num_cores=`grep -c '^processor' /proc/cpuinfo`

echo "you have $num_cores logic cores"

cmake -G "Unix Makefiles" \
  -DPATH_TO_LLVM_ROOT=${llvm_root_dir} . \
  ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp || exit 1

make && make ycm_support_libs -j${num_cores} || exit 1
