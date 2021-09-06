# Kafka on  k8s

The above helm chart install a kafka cluster (with or without creating a zookeeper cluster).

## Install the helm chart

Make sure you have already installed helm on your pc

```shell

cd k8s_support/kafka/helm_chart

# because it uses bitnami helm chart, so you need to download the bitnami dependencies
helm dependency update

# install the helm chart
helm install kafka-server . -f values.yaml

# Check the installed chart
helm ls

# It creates serval services() to allow you to connect to the kafka 
# you can check the services by typing
kubectl get svc | grep kafka-server

# You can check the difference between service and headless-service on my wiki 
# page employes:pengfei.liu:admin_system:container:k8s:08_k8s_service
kubectl run --rm utils -it --image eddiehale/utils --restart=Never bash

# lookup the network setup of each service
nslookup kafka-server
nslookup kafka-server-headless
```

## Test your kafka cluster

You can create a kafka client pod to test the kafka cluster.

```shell
# create a pod in one line
kubectl run --rm kafka-client -it --image bitnami/kafka --restart=Never bash

# goto the kafka/static folder, run below command
kubectl apply -f .
```

Once your kafka client pod is created, you can use following command to create topic, start a consumer/producer

```shell
cd /opt/bitnami/kafka/bin

# create a topic
kafka-topics.sh --create --zookeeper <zk-service-url> --replication-factor 3 --partitions 1 --topic test-topic

# in cluster service url for kafka server
kafka-server.user-pengfei.svc.cluster.local

# url for zk
kafka-server-zookeeper.user-pengfei.svc.cluster.local

# create a producer
kafka-console-producer.sh --broker-list <kafka-service-url>:9092 --topic test-topic
kafka-console-producer.sh --broker-list kafka-server.user-pengfei.svc.cluster.local:9092 --topic test-topic

# create a consumer
kafka-console-consumer.sh --bootstrap-server <kafka-service-url>:9092 --topic test-topic --from-beginning
kafka-console-consumer.sh --bootstrap-server kafka-server.user-pengfei.svc.cluster.local:9092 --topic test-topic --from-beginning
```