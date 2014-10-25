#!/bin/bash

PKG="epel.release ntfs-3g terminator zsh guake"

for package in $PKG; do
  echo "ready to install $package"
  sudo yum install -y -q $package
done
