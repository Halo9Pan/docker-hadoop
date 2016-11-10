# Start with openjdk image
FROM openjdk
MAINTAINER Halo9Pan <halo9pan@163.com>

ARG HADOOP_VERSION=2.7.3
ARG TAR=hadoop-$HADOOP_VERSION.tar.gz

LABEL Description="Hadoop", "Hadoop Version"="$HADOOP_VERSION"

WORKDIR /opt/

# RUN wget -t 100 --retry-connrefused -O "$TAR" http://mirrors.cnnic.cn/apache/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && tar zxf "$TAR"
ADD hadoop-${HADOOP_VERSION}.tar.gz .

RUN \
  ln -sv hadoop-$HADOOP_VERSION hadoop && \
  rm -f hadoop/bin/*.cmd && \
  rm -f hadoop/sbin/*.cmd && \
  rm -f hadoop/libexec/*.cmd


ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_PREFIX $HADOOP_HOME
ENV HADOOP_COMMON_HOME $HADOOP_PREFIX
ENV HADOOP_HDFS_HOME $HADOOP_PREFIX
ENV HADOOP_MAPRED_HOME $HADOOP_PREFIX
ENV HADOOP_YARN_HOME $HADOOP_PREFIX
ENV HADOOP_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV PATH $PATH:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin

WORKDIR /opt/hadoop/

RUN sed -i 's/${JAVA_HOME}/\/usr\/lib\/jvm\/java-8-openjdk-amd64/g' ${HADOOP_CONF_DIR}/hadoop-env.sh
