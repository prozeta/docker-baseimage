#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
bl Updating APT
apt-get -qq update
bl APT is up-to-date
bl Installing unzip, ruby, make, git
apt-get -qqy install unzip ruby make git >/dev/null 2>&1
bl Installed unzip, ruby, make, git
bl Installing etcd rubygem
gem install --no-rdoc --no-ri etcd >/dev/null
bl Installed etcd rubygem
