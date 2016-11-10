# Start with openjdk image
FROM halo9pan/hadoop
MAINTAINER Halo9Pan <halo9pan@163.com>

ADD core-site.xml $HADOOP_CONF_DIR
ADD hdfs-site.xml $HADOOP_CONF_DIR
ADD mapred-site.xml $HADOOP_CONF_DIR
ADD yarn-site.xml $HADOOP_CONF_DIR

RUN apt-get clean; apt-get update; apt-get install -y openssh-server openssh-client rsync wget tar hostname net-tools vim; apt-get clean

ADD id_rsa.pub /root/.ssh/authorized_keys

RUN mkdir /var/run/sshd
CMD ["/usr/sbin/sshd", "-D"]
