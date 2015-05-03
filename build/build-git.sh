#!/bin/bash

# please run the following commands in CentOS
#
# yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
# yum install asciidoc xmlto docbook2X
# ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

packageName=${PWD##*/}
prefix=${INSTALL_ROOT}/${packageName}
NUM_CORES=${NUM_CORES:-12}

# generate the configure
make configure || exit 1

# configure
./configure --prefix=${prefix} -datarootdir=${prefix}/share || exit 1

# compile
make -j${NUM_CORES} all doc || exit 1

# install
make install install-doc || exit 1

# make link
linkName=${packageName%%-*}
cd ${INSTALL_ROOT} || exit 1
rm -f ${linkName} && ln -s ${packageName} ${linkName} || exit 1
