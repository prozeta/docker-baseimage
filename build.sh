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

bl Disabling sshd
rm -rf /etc/service/sshd
rm -f /etc/my_init.d/00_regen_ssh_host_keys.sh
bl sshd disabled

bl Disabling cron
touch /etc/service/cron/down
bl cron disabled

bl Installing etcdctl
curl -L -q https://github.com/coreos/etcd/releases/download/v2.1.2/etcd-v2.1.2-linux-amd64.tar.gz -o/tmp/etcd-v2.1.2-linux-amd64.tar.gz 2>/dev/null
cd /tmp/
tar xzf etcd-v2.1.2-linux-amd64.tar.gz
cp etcd-v2.1.2-linux-amd64/etcdctl /bin/
cd /
rm -rf /tmp/etcd-v2.1.2-linux-amd64*
bl etcdctl installed

bl Installing etcdtmpl \& yaml2etcd
git clone --quiet https://github.com/blufor/etcd-tools.git /tmp/etcd-tools
cd /tmp/etcd-tools
make -s install
cd /
rm -rf /tmp/etcd-tools
bl etcdtmpl \& yaml2etcd installed

cleanup