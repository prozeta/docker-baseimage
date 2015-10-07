#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

bl () {
  echo "==== ${*} ===="
}

cleanup () {
  bl "Cleaning up"
  apt-get -qq clean
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/apt /var/log/dpkg.log /var/log/alternatives.log /var/log/bootstrap.log /var/log/faillog /var/log/lastlog /var/log/dmesg /var/log/fsck /var/log/btmp /var/log/wtmp /var/log/upstart /var/log/unattended-upgrades
  bl "Clean-up done"
}

svc_dir () {
  bl "Creating service directory for ${1}"
  mkdir -p /etc/service/${1}
  bl "Service directory for ${1} created"
}

tmpl () {
  file=$1
}