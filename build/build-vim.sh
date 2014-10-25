./configure --with-features=huge \
  --enable-multibyte \
  --enable-pythoninterp \
  --enable-cscope \
  --prefix=${HOME}/vroot/ && \
make -j8 && make install
