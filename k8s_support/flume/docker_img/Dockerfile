# get access to a docker container
# sudo docker exec -it <container-id> /bin/bash

# This docker file installs a flume 1.9.0
# official openjdk image based on debian, use apt as package manager
FROM openjdk:11

ARG version=1.9.0
ENV FLUME_HOME=/opt/apache-flume
ENV PATH="${FLUME_HOME}/bin:${PATH}"


ADD https://www.apache.org/dist/flume/${version}/apache-flume-${version}-bin.tar.gz /tmp/apache-flume-${version}-bin.tar.gz

# install netcat for testing, need to be removed for prod
RUN apt-get update && apt-get install -y netcat maven

WORKDIR /tmp
RUN tar -xzf apache-flume-${version}-bin.tar.gz
RUN rm -rf /tmp/apache-flume-${version}-bin.tar.gz
RUN mv apache-flume-${version}-bin ${FLUME_HOME}
RUN cp ${FLUME_HOME}/conf/log4j.properties ${FLUME_HOME}/log4j.properties
# ADD hdfs s3 dependencies
ADD pom.xml ${FLUME_HOME}/pom.xml
ADD agent_conf/simple.conf ${FLUME_HOME}/conf/simple.conf
ADD flume-env.sh ${FLUME_HOME}/conf/flume-env.sh

WORKDIR ${FLUME_HOME}
RUN mvn process-sources

CMD [ "sh","-c", "./bin/flume-ng agent -n a1 -c conf -f conf/simple.conf -Dlog4j.configuration=log4j.properties -Dflume.monitoring.type=http -Dflume.monitoring.port=44123" ]


