#!/bin/sh

# Build LAOS from Sultan Recources for Oneplus 3/3T
repo sync -c -j 16
source build/envsetup.sh
./patcher/patcher.sh
breakfast oneplus3
brunch oneplus3

