# Start with openjdk image
FROM halo9pan/hadoop-cluster
MAINTAINER Halo9Pan <halo9pan@163.com>

ADD id_rsa /root/.ssh/
RUN chmod 600 $HOME/.ssh/id_rsa

RUN echo "StrictHostKeyChecking no" >> $HOME/.ssh/config && echo "UserKnownHostsFile /dev/null" >> $HOME/.ssh/config

RUN hadoop namenode -format

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
