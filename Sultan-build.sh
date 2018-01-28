#!/bin/sh

# Build LAOS from Sultan Recources for Oneplus 3/3T
./patcher/unpatcher.sh
repo sync -c -j 16
./patcher/patcher.sh
source build/envsetup.sh
mka clean
breakfast oneplus3
pause
brunch oneplus3

