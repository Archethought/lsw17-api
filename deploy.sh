#!/bin/bash

dockerName=lsw17api
port=8888
logging=syslog
#host_share=/home/cownby/api/app
#container_share=/app

docker stop $dockerName;
docker rm $dockerName;
docker rmi $dockerName;
docker build --no-cache=true -t $dockerName .;
#docker run -d --name $dockerName -p $port:80 --log-driver $logging -v ${host_share}:${container_share}  $dockerName
docker run -d --name $dockerName -p $port:80 --log-driver $logging   $dockerName
