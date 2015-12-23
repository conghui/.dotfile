#!/bin/bash

# this script must be run as non-root user
if [[ $EUID -eq 0 ]]; then
  echo "This script must be run as non-root user"
  exit 1
fi

user=`whoami`

sudo curl -sSL https://get.docker.com/ | sh || exit 1
sudo chkconfig docker on || exit 1
sudo service docker start || exit 1

echo "adding $user to docker group"
sudo usermod -aG docker $user || exit 1
