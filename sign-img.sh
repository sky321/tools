#!/bin/bash

KEYS_DIR=/home/build/android/.android-cert

# gen target files
#source build/envsetup.sh
breakfast oneplus3
mka target-files-package otatools

# sign all the APKs
croot
./build/tools/releasetools/sign_target_files_apks -o -d $KEYS_DIR $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip signed-target_files.zip
	
# generate the installable zip
./build/tools/releasetools/ota_from_target_files -k $KEYS_DIR/releasekey --block --backup=true signed-target_files.zip signed-ota_update.zip