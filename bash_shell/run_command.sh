#!/bin/bash
# this script runs a given command on remote servers
# $* returns all the arguments, unlike $@ returns them as a list
# for example, we can use this script to run jps on all servers to see all jdk processus.

for host in lin01 lin02 lin03
do
  echo =================== "${host}" ============================
  echo run command "$*"
  ssh "${host}" "$*"
done