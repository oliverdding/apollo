#!/bin/sh

WORKING_DIR="$(
    cd "$(dirname "$0")"
    pwd
)"
cd $WORKING_DIR

docker build --pull -t oliverdd/apollo:base .

if [ -n "$1" ] ;then
  if [ "$1" = "-p" ] ;then
    docker push oliverdd/apollo:base
  fi
fi
