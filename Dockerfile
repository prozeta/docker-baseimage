FROM phusion/baseimage:0.9.17
MAINTAINER Radek Slavicinsky "radek@blufor.cz"
ENV ETCD_VERSION "2.2.0"
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ADD tools/* /bin/
ADD build.sh /build.sh
RUN /build.sh && rm -f /build.sh
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
