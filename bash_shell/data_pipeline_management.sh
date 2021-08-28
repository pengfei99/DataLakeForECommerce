#!/bin/bash
# We have the script to launch hdfs, zk, kafka, flume. To start and stop them in order, we need another script to
# manage

# check the argument number
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters, try flume_agent_management.sh start/stop"
    exit 1
fi

# for each argument, run the corresponding logic
case $1 in
"start")
  echo "-------------------- start cluster service  -----------------------"
  # start zk
  sh zk_cluster_management.sh start

  # sleep 5 second for zk to complete start, so kafka can start without errors
  sleep 5

  # start hdfs
  sh hdfs_management.sh start


  # start kafka
  sh kafka_cluster_management.sh start

  # start the two flume agent
  sh flume_agent1_management.sh start
  sh flume_agent2_management.sh start

;;

"stop")
  echo "-------------------- stop cluster service -----------------------"

  # stop flume
  sh flume_agent_management1.sh stop
  sh flume_agent_management2.sh stop

  # stop kafka
  sh kafka_cluster_management.sh stop

  # stop hdfs
  sh hdfs_management.sh stop

  # stop zk
  sh zk_cluster_management.sh stop

;;

*)

echo "Illegal arguments, try kafka_cluster_management.sh start/stop"
exit 1
;;
esac