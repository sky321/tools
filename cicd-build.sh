#!/bin/bash

docker run \
    -e "BRANCH_NAME=lineage-18.1" \
    -e "DEVICE_LIST=FP2" \
    -e "SIGN_BUILDS=true" \
    -v "/home/sky/srv/lineage:/srv/src" \
    -v "/home/sky/srv/zips:/srv/zips" \
    -v "/home/sky/srv/logs:/srv/logs" \
    -v "/home/sky/srv/cache:/srv/ccache" \
    -v "/home/sky/srv/keys:/srv/keys" \
    lineageos4microg/docker-lineage-cicd

