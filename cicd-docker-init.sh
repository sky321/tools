#!/bin/bash

git clone https://github.com/lineageos4microg/docker-lineage-cicd.git

sudo ./cicd-mkdir.sh
cd docker-lineage-cicd
sudo cicd-build.sh
