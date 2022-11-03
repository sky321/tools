# Build Lineage on Docker

- Tools repo 
	- keygen.sh = erstellt eigene keys um damit die imgages zu sign 
	- build.sh = repo sync und build des images (std)
		- std test-keys, für dev-keys (vendor/lineage/config/common.mk)
	- sign-img.sh = nachträglich sign der images (test-keys) mit eigenen keys (release-keys)
	- build-sign.sh = repo sync und build des images (signed image release key)
	- build-devices.sh = generic build without repo sync, clean, breakfast
	- lineage-test2official.zip = migration von unofficial zu official
	- lineage-official2test.zip = migration von official zu unofficial
		- update-binary = script um key zu überschreiben
		- key-exportieren.txt = how to export the keys
	- lvm.txt = ist die platte mal voll 
	- local_manifests = ordner mit verschiedenen manifest.xml
		- ordner in .repo erstellen und passendes xml rein kopieren
	- docker-init.sh = erstellt docker container zum bauen der images

- Tools clonen
	- git clone https://github.com/sky321/tools.git
	- cp tools/docker-init.sh .
	- chmod +x *sh
	- sudo ./docker-init.sh

- Docker Container erstellen
	- Mit docker-init.sh aus tools
		- git clone https://github.com/sky321/docker-lineageos.git
		- cd docker-lineageos
		- sudo ./run.sh

- repo initialisieren
	- repo init -u https://github.com/LineageOS/android.git -b lineage-18.1
	- repo sync -c -j 16
	- mkdir .repo/local_manifests
	- exit
	- sudo cp ../tools/local_manifests/oneplus3.xml android/.repo/local_manifests/
	- sudo cp ../tools/build* android/
	- sudo cp ../tools/keygen* android/
	- sudo ./run.sh
	- chmod +x *sh

- build lineageOS image to install signed
	- ./keygen.sh (run only once!)
	- ./build-sign.sh (erstellt signed image)

- build lineageOS test-keys
	- ./build.sh

Infos zu sign der keys auf AOSP und Lineage
- https://wiki.lineageos.org/signing_builds.html
- https://source.android.com/devices/tech/ota/sign_builds
- https://forum.xda-developers.com/galaxy-s3-verizon/orig-development/rom-cyanogenmod-14-1-nightlies-verizon-t3513296/page37