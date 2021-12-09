#!/bin/sh

WORKING_DIR="$(
    cd "$(dirname "$0")"
    pwd
)"
cd $WORKING_DIR

docker build --pull -t oliverdd/apollo:gcc .

if [ -n "$1" ] ;then
  if [ "$1" = "-p" ] ;then
    docker push oliverdd/apollo:gcc
  fi
fi
