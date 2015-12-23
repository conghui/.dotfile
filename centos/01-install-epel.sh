#!/bin/bash

rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

sudo sed -i "s/mirrorlist=https/mirrorlist=http/" /etc/yum.repos.d/epel.repo

#yum upgrade ca-certificates --disablerepo=epel

#yum clean all && yum makecache
