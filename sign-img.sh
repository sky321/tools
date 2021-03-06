#!/bin/bash

KEYS_DIR=/home/build/android/.android-certs
OUT=/home/build/android/out/target/product/oneplus3

# gen target files (only if not run direct after build)
#source build/envsetup.sh
#breakfast oneplus3
#mka target-files-package otatools
# oder auch
#mka target-files-package dist
#[ $? -ne 0 ] && { echo "Error at make target files"; exit 1; }

# sign all the APKs
croot
./build/tools/releasetools/sign_target_files_apks -o -d $KEYS_DIR $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip signed-target_files.zip
[ $? -ne 0 ] && { echo "Error at sign APKs"; exit 1; }

# generate the signed installable OTA zip
./build/tools/releasetools/ota_from_target_files -k $KEYS_DIR/releasekey --block --backup=true signed-target_files.zip signed-ota_update.zip