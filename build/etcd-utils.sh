#!/bin/bash

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