#!/bin/bash

KEYS_DIR=/home/build/android/.android-cert
vendor=lineage
subject='/C=US/ST=California/L=Mountain View/O=Android/OU=Android/CN=Android/emailAddress=android@android.com'

mkdir ~/.android-certs
for x in releasekey platform shared media testkey; do ./development/tools/make_key $KEYS_DIR/$x "$subject"; done

sed -i "1s;^;PRODUCT_DEFAULT_DEV_CERTIFICATE := $KEYS_DIR/releasekey\nPRODUCT_OTA_PUBLIC_KEYS := $KEYS_DIR/releasekey\nPRODUCT_EXTRA_RECOVERY_KEYS := $KEYS_DIR/releasekey\n\n;" "vendor/$vendor/config/common.mk"
