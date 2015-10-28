#!/usr/bin/env bash

echo "deb http://http.debian.net/debian jessie-backports main" | sudo tee -a /etc/apt/sources.list
apt-get update
apt-get -y install libncurses5-dev rsync unzip bc
apt-get -t jessie-backports -y install docker.io
