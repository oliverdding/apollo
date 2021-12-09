#!/bin/sh

WORKING_DIR="$(
    cd "$(dirname "$0")"
    pwd
)"
cd $WORKING_DIR

docker build -t oliverdd/apollo:rust .

if [ -n "$1" ] ;then
  if [ "$1" = "-p" ] ;then
    docker push oliverdd/apollo:rust
  fi
fi
