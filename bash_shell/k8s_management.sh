# get all pods, remove header, filter the pods with status completed, get the pod name, delete the pod

kubectl get pods | grep -v NAME | grep "Completed" | awk '{print $1}'| xargs -n1 kubectl delete pods