FROM phusion/baseimage:0.9.18
MAINTAINER Radek Slavicinsky "radek@blufor.cz"
ENV ETCD_VERSION "2.2.0"
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ADD tools/* /bin/
ADD build.sh /build.sh
RUN /build.sh && rm -f /build.sh
