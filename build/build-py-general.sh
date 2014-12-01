#!/bin/bash

packageName=${PWD##*/}          
prefix=${HOME}/vroot/local/${packageName}

python2.7 ./setup.py install --prefix=${prefix}
