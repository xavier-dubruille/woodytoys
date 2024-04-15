#/bin/bash

set -e

default_version="3"
version=${1:-"$default_version"}


docker build -t xdubruille/woody_api:"$version" api 
docker tag xdubruille/woody_api:"$version" xdubruille/woody_api:latest

docker build -t xdubruille/woody_rp:"$version" reverse-proxy
docker tag xdubruille/woody_rp:"$version" xdubruille/woody_rp:latest

docker build -t xdubruille/woody_database:"$version" database
docker tag xdubruille/woody_database:"$version" xdubruille/woody_database:latest

docker build -t xdubruille/woody_front:"$version" front
docker tag xdubruille/woody_front:"$version" xdubruille/woody_front:latest


# avec le "set -e" du début, je suis assuré que rien ne sera pushé si un seul build ne c'est pas bien passé

docker push xdubruille/woody_api:"$version"
docker push xdubruille/woody_api:latest

docker push xdubruille/woody_rp:"$version"
docker push xdubruille/woody_rp:latest

docker push xdubruille/woody_front:"$version"
docker push xdubruille/woody_front:latest

docker push xdubruille/woody_database:"$version"
docker push xdubruille/woody_database:latest
