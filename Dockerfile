FROM phusion/baseimage:0.9.17
MAINTAINER Radek Slavicinsky "radek@blufor.cz"

# Switch sh to bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# copy tools
ADD tools/* /bin/

# run build
ADD build/packages.sh /tmp/packages.sh
RUN /tmp/packages.sh

ADD build/disable-services.sh /tmp/disable-services.sh
RUN /tmp/disable-services.sh

ADD build/etcd-utils.sh /tmp/etcd-utils.sh
RUN /tmp/etcd-utils.sh

RUN cleanup

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
