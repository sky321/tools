#!/bin/bash

git clone https://github.com/lineageos4microg/docker-lineage-cicd.git

sudo ./cicd-mkdir.sh
cp cicd-build.sh docker-lineage-cicd/
cd docker-lineage-cicd