#!/bin/bash

bin=`dirname $0`
if [ `docker-machine ls | grep Running | grep -vc grep` != "0" ] ; then
  echo "$(docker-machine env dev)"
  eval "$(docker-machine env dev)"

  # database
  CONTAINER_NAME=generic-mysql
  docker stop ${CONTAINER_NAME}
  docker rm ${CONTAINER_NAME}
  docker run --name ${CONTAINER_NAME} -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -p 3306:3306 -d mysql:latest
else
  echo "Docker Machine is not running"
  docker-machine start dev
fi
