#!/bin/bash
# This script can copy files (in argument) to remote server
# $# returns the number of arguments.
# $@ return the list of arguments
# dirname /tmp/VMwareTools-10.3.10-12406962.tar.gz returns /tmp
# basename /tmp/VMwareTools-10.3.10-12406962.tar.gz returns VMwareTools-10.3.10-12406962.tar.gz
# check argument number
if [ "$#" -lt 1 ]
then
  echo Not enough argument!
  exit;
fi

# loop through all servers in the cluster
for host in lin01 lin02 lin03
do
  echo ============================= $host ==============================================
  # loop through all files in current directory
  for file in "$@"
  do
    # check if the file exist or not
    echo "${file}"
    if [ -e "${file}" ]
    then
      # get parent dir name
      pdir=$(cd -P $(dirname "${file}"); pwd)
      fname=$(basename "${file}" )
      echo parent dir is "${pdir}" filename is "${fname}"
      # create the dir in remote server
      ssh "${host}" "mkdir -p ${pdir}"
      # copy the file to remote server
      rsync -av "${file}" "${host}:${pdir}"
    else
      echo file "${file}" does not exist
    fi
  done
done