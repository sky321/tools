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
#brunch oneplus3

KEYS_DIR=/home/build/android/.android-cert
OUT=/home/build/android/out/target/product/oneplus3

# gen target files (only if not run direct after build)
#source build/envsetup.sh
#breakfast oneplus3
mka target-files-package otatools
# oder auch
#mka target-files-package dist
[ $? -ne 0 ] && { echo "Error at make target files"; exit 1; }

# sign all the APKs
croot
./build/tools/releasetools/sign_target_files_apks -o -d $KEYS_DIR $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip signed-target_files.zip
[ $? -ne 0 ] && { echo "Error at sign APKs"; exit 1; }

# generate the signed installable OTA zip
./build/tools/releasetools/ota_from_target_files -k $KEYS_DIR/releasekey --block --backup=true signed-target_files.zip signed-ota_update.zip