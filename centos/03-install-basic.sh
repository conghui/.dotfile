#!/bin/bash

yum install -y  xclip \
                terminator \
                guake \
                libcurl-devel \
                openssl-devel \
                zsh \
                scons \
                openssl \
                bwm-ng

# unrar
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.i686.rpm
rpm -Uvh rpmforge-release-0.5.2-2.el6.rf.i686.rpm
rm rpmforge-release-0.5.2-2.el6.rf.i686.rpm
yum install -y unrar
