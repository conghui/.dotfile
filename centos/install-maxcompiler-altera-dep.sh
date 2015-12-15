#!/bin/bash

# install dependencies for maxcompiler
yum update -y && \
    yum groupinstall -y "Development Tools" \
    yum clean all

# install dependencies for maxcompiler
yum install -y ant \
                   blas \
                   java-1.7.0-openjdk-devel.x86_64 \
                   lapack \
                   ImageMagick \
                   xorg-x11-server-Xvfb \
                   && yum clean all

# install dependencies for altera quartus
yum install -y compat-libstdc++-33.i686 \
                   expat.i686 \
                   fontconfig.i686 \
                   freetype.i686 \
                   glibc.i686 \
                   gtk2.i686 \
                   libcanberra-gtk2.i686 \
                   gtk2-engines-2.18.4-5.el6.centos.i686 \
                   libpng.i686 \
                   libICE.i686 \
                   libSM.i686 \
                   libuuid.i686 \
                   ncurses-devel.i686 \
                   ncurses-libs.i686 \
                   PackageKit-gtk-module.i686 \
                   tcldevel.i686 \
                   tcl.i686 zlib.i686 \
                   libX11.i686 \
                   libXau.i686 \
                   libXdmcp.i686 \
                   libXext.i686 \
                   libXft-devel.i686 \
                   libXft.i686 \
                   libXrender.i686 \
                   libXt.i686 \
                   libXtst.i686 \
                   && yum clean all

# user specific application
yum install -y vim \
                   tar \
                   which \
                   && yum clean all

