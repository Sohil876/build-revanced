#!/usr/bin/env bash
#
## Build ReVanced
#

# Vars (DO NOT CHANGE!)
source conf.sh # Load conf file

# Find and select apksigner binary
apksigner="$(find $ANDROID_SDK_ROOT/build-tools -name apksigner | sort -r | head -n 1)"
# Sign apks (https://github.com/tytydraco/public-keystore)
${apksigner} sign --ks public.jks --ks-key-alias public --ks-pass pass:public --key-pass pass:public --in ./revanced.apk --out ./revanced_signed.apk && 
if [ "${SOURCE_BUILD_MANAGER^^}" = TRUE ]; then
  ${apksigner} sign --ks public.jks --ks-key-alias public --ks-pass pass:public --key-pass pass:public --in ./manager_compose_debug.apk --out ./revanced_manager_compose_signed.apk
fi

