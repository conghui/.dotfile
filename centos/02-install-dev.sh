#!/bin/bash

sudo yum groupinstall "Development Tools" -y
sudo yum install -y readline-devel \
 python-devel \
 ncurses-devel \
 cmake \
 git \
 gtk2-devel \
 pkgconfig \
 numpy \
 blas \
 ant
