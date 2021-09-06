# delete all container
# grep -v means invert match, here means we skip the first line of the ps output
# use awk to split the text, use space as separator.
# note the command separate by | are considered as a individual, so the first with sudo, the second with normal right
# try to remove sudo from docker rm and see what will happen
sudo docker ps -a | grep -v CONTAINER |awk '{print $1}' | xargs -n1 sudo docker rm

# remove all image with repository and tag as <none>
sudo docker image list | grep \<none\> | awk '{print $3}' | xargs -n1 sudo docker rmi