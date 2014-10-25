#!/bin/bash

packageName="scons"
version="2.3.1"
prefix=${HOME}/vroot/local/${packageName}-${version}

python2.7 ./setup.py install --prefix=${prefix}
