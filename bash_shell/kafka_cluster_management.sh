#!/bin/bash
# This script allows you to start and stop kafka on all nodes in a kafka cluster. The user who run this
# script needs to have ssh access to the kafka nodes

# where your zookeeper bin is installed, in this example we suppose it's in /opt/module/zookeeper-3.5.7
base_dir="/opt/module/kafka-2.8.0"
# we suppose we have three nodes in the cluster (e.g. lin01, lin02, lin03), To adapte this script you need to change
# the below hosts list
# Declare an array of string for kafka nodes hostname in the cluster
declare -a hosts=("lin01" "lin02" "lin03")

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters, try kafka_cluster_management.sh start/stop"
    exit 1
fi

case $1 in
"start")
for i in "${hosts[@]}"
do
  echo "-------------------- start kafka process on $i -----------------------"
  ssh $i "${base_dir}/bin/kafka-server-start.sh -daemon ${base_dir}/config/server.properties"
done
;;

"stop")
for i in "${hosts[@]}"
do
  echo "-------------------- stop kafka process on $i -----------------------"
  ssh $i "${base_dir}/bin/kafka-server-stop.sh"
done
;;

*)
echo "Illegal arguments, try kafka_cluster_management.sh start/stop"
exit 1
;;
esac