#!/bin/bash

KEYS_DIR=/home/build/android/.android-certs
vendor=lineage
subject='/C=US/ST=California/L=Mountain View/O=Android/OU=Android/CN=Android/emailAddress=android@android.com'

# keys generate
mkdir $KEYS_DIR
for x in releasekey platform shared media networkstack testkey; do ./development/tools/make_key $KEYS_DIR/$x "$subject"; done
#[ $? -ne 0 ] && { echo "Error at make keys"; exit 1; }

# use new keys in common.mk for vendor (dev-keys)
#sed -i "1s;^;PRODUCT_DEFAULT_DEV_CERTIFICATE := $KEYS_DIR/releasekey\nPRODUCT_OTA_PUBLIC_KEYS := $KEYS_DIR/releasekey\nPRODUCT_EXTRA_RECOVERY_KEYS := $KEYS_DIR/releasekey\n\n;" "vendor/$vendor/config/common.mk"

# symlink certs
#cd $KEYS_DIR
#for c in cyngn{-priv,}-app testkey; do
#for e in pk8 x509.pem; do
#ln -s releasekey.$e $c.$e;
#done;
#done