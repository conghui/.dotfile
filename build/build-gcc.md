## download package
  http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-4.8.4/gcc-4.8.4.tar.bz2

## sample command
'''
  tar xzf gcc-4.6.2.tar.gz
  cd gcc-4.6.2
  ./contrib/download_prerequisites
  cd ..
  mkdir objdir
  cd objdir
  $PWD/../gcc-4.6.2/configure --prefix=$HOME/gcc-4.6.2 --disable-multilib
  make
  make install
'''

## offline installation
If you cannot connect to the internet, you should prepare the prerequisite, 
the GMP, MPFR and MPC packages.

you can put the source code of the three packages to the root directory of 
gcc source code directory and make a soft link without the vername to it. 
say `ln -s gmp-4.3.2 gmp`
