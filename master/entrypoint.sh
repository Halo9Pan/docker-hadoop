#!/bin/bash
# set -e

/usr/sbin/sshd -D &

if [ "$1" = 'start' ]; then
  $HADOOP_HOME/sbin/start-dfs.sh
  $HADOOP_HOME/sbin/start-yarn.sh

  trap "stop-dfs.sh && stop-yarn.sh" HUP INT QUIT TERM
  sleep infinity
else
  exec "$@"
fi
