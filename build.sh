#!/bin/bash

# Build LAOS for Oneplus 3/3T
cd /home/build/android/
pwd

repo sync -c -j 16
[ $? -ne 0 ] && { echo "Error at repo sync"; exit 1; }

source build/envsetup.sh
mka clean
[ $? -ne 0 ] && { echo "Error at make clean"; exit 1; }

#tristate button & Gallery2
#repopick 215212 -f

breakfast oneplus3
brunch oneplus3