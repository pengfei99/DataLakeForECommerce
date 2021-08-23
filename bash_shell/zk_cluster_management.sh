#!/bin/bash
# This script allows you to start stop, and check status of our nodes in a zookeeper cluster. The user who run this
# script needs to have ssh access to the zk nodes

# where your zookeeper bin is installed, in this example we suppose it's in /opt/module/zookeeper-3.5.7
base_dir="/opt/module/zookeeper-3.5.7"
# we suppose we have three nodes in the cluster (e.g. lin01, lin02, lin03), To adapte this script you need to change
# the below hosts list
# Declare an array of string for zk nodes hostname in the cluster
declare -a hosts=("lin01" "lin02" "lin03")

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters, try zk_cluster_management.sh start/stop/status"
    exit 1
fi

case $1 in
"start")
for i in "${hosts[@]}"
do
  echo "-------------------- start $i -----------------------"
  ssh $i "${base_dir}/bin/zkServer.sh start"
done
;;

"stop")
for i in "${hosts[@]}"
do
  echo "-------------------- stop $i -----------------------"
  ssh $i "${base_dir}/bin/zkServer.sh stop"
done
;;

"status")
for i in "${hosts[@]}"
do
  echo "-------------------- $i status -----------------------"
  ssh $i "${base_dir}/bin/zkServer.sh status"
done
;;

*)
echo "Illegal arguments, try zk_cluster_management.sh start/stop/status"
exit 1
;;
esac