#!/bin/bash

cp epel* /etc/yum.repos.d/

yum upgrade ca-certificates --disablerepo=epel

yum clean all && yum makecache
