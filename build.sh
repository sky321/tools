#!/bin/bash

# Build LAOS for Oneplus 3/3T
cd /home/build/android/
pwd
#./patcher/unpatcher.sh
#read -p "unPatcher OK?"
repo sync -c -j 16
read -p "Sync OK?"
#./patcher/patcher.sh
#read -p "Patcher OK?"
source build/envsetup.sh
#read -p "Env OK?"
mka clean
#read -p "Clean OK?"
breakfast oneplus3
#read -p "Breakfast OK?"
brunch oneplus3

