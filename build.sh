#!/bin/sh

set -e

WORKING_DIR="$(
    cd "$(dirname "$0")"
    pwd
)"
cd $WORKING_DIR

bash ./base/build.sh -p
bash ./dev/gcc/build.sh -p
bash ./dev/go/build.sh -p
bash ./dev/python/build.sh -p
bash ./dev/rust/build.sh -p
bash ./dev/sdkman/build.sh -p
bash ./dev/sdkman.d/java/build.sh -p
bash ./dev/sdkman.d/scala/build.sh -p
