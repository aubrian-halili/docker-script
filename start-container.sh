#!/bin/bash

bin=`dirname $0`
if [ `docker-machine ls | grep Running | grep -vc grep` != "0" ] ; then
  echo "$(docker-machine env dev)"
  eval "$(docker-machine env dev)"

  # database
  CONTAINER_NAME=generic-mysql
  docker start ${CONTAINER_NAME}
  # echo "ssh root@${DOCKER_IP} -p 3306 mysql -u root curia < ${DUMP_FILE_PATH}"
else
  echo "Docker Machine is not running"
  docker-machine start dev
fi
