#!/bin/bash

# Build LAOS for Oneplus 3/3T
cd /home/build/android/
pwd
repo sync -c -j 16
read -p "Sync OK?"
source build/envsetup.sh
mka clean
breakfast oneplus3
brunch oneplus3

