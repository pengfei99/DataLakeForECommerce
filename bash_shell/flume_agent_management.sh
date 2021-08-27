#!/bin/bash
# This script allows you to start and stop a flume agent. The user who run this
# script needs to have ssh access to the nodes that runs the flume agent.

# base_dir is the home path of flume bin
base_dir="/opt/module/flume-1.9.0"

# flume agent name, you need to change it for your env. It must correspond the agent name declared inside the
# flume agent conf file
flume_agent_name="a1"

# flume agent conf file path, you need to change it for your env
flume_agent_conf_file_path="/tmp/flume/conf"

# flume agent conf file name, you need to change it for your env
flume_agent_conf_file_name="file-flume-kafka.conf"

# Declare an array of string for flume nodes hostname in the cluster
declare -a hosts=("lin01" "lin02" "lin03")

# check the argument number
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters, try flume_agent_management.sh start/stop"
    exit 1
fi

# for each argument, run the corresponding logic
case $1 in
"start")
for i in "${hosts[@]}"
do
  echo "-------------------- start flume agent process on $i -----------------------"
  # 1 is standard output, 2 is error output, so 2>$1 means redirect error output to standard output
  ssh $i "${base_dir}/bin/flume-ng agent --conf-file ${flume_agent_conf_file_path}/${flume_agent_conf_file_name}
  --name ${flume_agent_name} -Dflume.root.logger=INFO,LOGFILE>${base_dir}/logs/${flume_agent_conf_file_name}_log.txt 2>&1 &"
done
;;

"stop")
for i in "${hosts[@]}"
do
  echo "-------------------- stop flume agent process on $i -----------------------"
  # ps -ef print all process, then we filter the process by using the conf file name
  # grep -v grep to discard the grep process,
  # awk '{print $2 }' to split the process string by using space as separator, we choose the seconde column, which is
  # the process number, try ps -ef | grep ps | grep -v grep | awk '{print $2}' on your terminal
  # xargs take the result of the previous command as the input of the next command, -n1 means take 1 line at a time
  # in our case, xargs takes the process number line by line and run kill -9 with the process number as argument
  ssh $i "ps -ef | grep ${flume_agent_conf_file_name} | grep -v grep | awk '{print \$2}' | xargs -n1 kill -9"
done
;;

*)

echo "Illegal arguments, try kafka_cluster_management.sh start/stop"
exit 1
;;
esac