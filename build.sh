#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

b updating APT...
apt-get -qq update
bl OK

b installing unzip, ruby, make, git...
apt-get -qqy install unzip ruby make git >/dev/null 2>&1
bl OK

b installing etcd rubygem...
gem install --no-rdoc --no-ri etcd >/dev/null
bl OK

b disabling sshd...
rm -rf /etc/service/sshd
rm -f /etc/my_init.d/00_regen_ssh_host_keys.sh
bl OK

b disabling cron...
touch /etc/service/cron/down
bl OK

b installing etcdctl...
curl -L -q https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz -o/tmp/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz 2>/dev/null
cd /tmp/
tar xzf etcd-v${ETCD_VERSION}-linux-amd64.tar.gz
cp etcd-v${ETCD_VERSION}-linux-amd64/etcdctl /bin/
cd /
rm -rf /tmp/etcd-v${ETCD_VERSION}-linux-amd64*
bl OK

b installing etcd-tools...
gem install etcd-tools --no-rdoc --no-ri
bl OK

cleanup
