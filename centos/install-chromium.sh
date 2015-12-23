#!/bin/bash

sudo yum localinstall http://install.linux.ncsu.edu/pub/yum/itecs/public/chromium/rhel6/noarch/chromium-release-1.1-1.noarch.rpm && \
cd /etc/yum.repos.d && \
sudo curl http://people.centos.org/hughesjr/chromium/6/chromium-el6.repo -o chromium-el6.repo && \
sudo yum install -y chromium
