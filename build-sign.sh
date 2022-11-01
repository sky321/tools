#!/bin/bash

[ "$1" == '' ] && { echo "Device Parameter needed"; exit 1; }

# Build LAOS for different devices
START=$(date)
SECONDS=0
DEVICE=$1

cd /home/build/android/
pwd

repo sync -c -j 16
[ $? -ne 0 ] && { echo "Error at repo sync"; exit 1; }

source build/envsetup.sh
mka clean
[ $? -ne 0 ] && { echo "Error at make clean"; exit 1; }

breakfast $DEVICE

KEYS_DIR=/home/build/android/.android-certs
OUT=/home/build/android/out/target/product/$DEVICE
TARGET_FILES_SIGNED=lineage-$(get_build_var LINEAGE_VERSION)-signed-target_files.zip
OTA_PACKAGE=lineage-$(get_build_var LINEAGE_VERSION)-signed.zip

# gen target files (only if not run direct after build)
mka target-files-package otatools
[ $? -ne 0 ] && { echo "Error at make target files"; exit 1; }

# sign all the APKs
croot
./build/tools/releasetools/sign_target_files_apks -o -d $KEYS_DIR $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip $TARGET_FILES_SIGNED
[ $? -ne 0 ] && { echo "Error at sign APKs"; exit 1; }

# generate the signed installable OTA zip
./build/tools/releasetools/ota_from_target_files -k $KEYS_DIR/releasekey --block --backup=true $TARGET_FILES_SIGNED $OTA_PACKAGE

END=$(date)
elapsedseconds=$SECONDS
echo "Start: $START"
echo "Ende : $END"
echo "Duration:"
TZ=UTC0 printf '%(%H:%M:%S)T\n' "$elapsedseconds"