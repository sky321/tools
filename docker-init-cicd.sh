#!/bin/bash

git clone https://github.com/lineageos4microg/docker-lineage-cicd.git

sudo ./make-cicd.sh
cd docker-lineage-cicd
sudo docker-build-cicd.sh
