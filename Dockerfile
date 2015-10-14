FROM phusion/baseimage:0.9.17
MAINTAINER Radek Slavicinsky "radek@blufor.cz"

# install basic
RUN export DEBIAN_FRONTEND=noninteractive && apt-get -qq update && apt-get -qqy install unzip ruby make git
RUN gem install --no-rdoc --no-ri etcd

# disable SSH & Cron
RUN rm -rf /etc/service/sshd
RUN rm -f /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN touch /etc/service/cron/down

# install etcdctl
RUN curl -L -q https://github.com/coreos/etcd/releases/download/v2.1.2/etcd-v2.1.2-linux-amd64.tar.gz -o/tmp/etcd-v2.1.2-linux-amd64.tar.gz 2>/dev/null
RUN cd /tmp/ && tar xzvf etcd-v2.1.2-linux-amd64.tar.gz && cp etcd-v2.1.2-linux-amd64/etcdctl /bin/ && rm -rf /tmp/etcd-v2.1.2-linux-amd64*

# install blufor's etcd-tools
RUN git clone https://github.com/blufor/etcd-tools.git /tmp/etcd-tools && cd /tmp/etcd-tools && make install && cd / && rm -rf /tmp/etcd-tools

# clean-up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/apt /var/log/dpkg.log /var/log/alternatives.log /var/log/bootstrap.log /var/log/faillog /var/log/lastlog /var/log/dmesg /var/log/fsck /var/log/btmp /var/log/wtmp /var/log/upstart /var/log/unattended-upgrades

ADD tools/* /bin/
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN mkdir -p /cfg

##
## PUT THESE INTO CHILDREN OF THIS DOCKERFILE (you want to add more repos, right? ;))
##
# ONBUILD ENV ETCD_HOST "etcd"
# ONBUILD ENV ETCD_PORT 4001
# ONBUILD COPY build.sh /build.sh
# ONBUILD RUN /build.sh && rm -f /build.sh
# ONBUILD COPY prepare.sh /etc/my_init.d/00-prepare.sh
# ONBUILD COPY cfg/* /cfg/
# ONBUILD RUN rm -f /cfg/.gitkeep
