cmake -G "Unix Makefiles" \
  -DPATH_TO_LLVM_ROOT=~/softs/install/clang/ . \
  ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp

make -j4 ycm_core
