#!/usr/bin/env bash
#
## Build ReVanced
#

# Vars (DO NOT CHANGE!)
source conf.sh # Load conf file

# Patch revanced
echo ""
echo "Patching youtube apk..."
echo ""
java -jar ${R_CLI} -a ${YOUTUBE_APK} -b ${R_PATCHES} -m ${R_INTEGRATIONS} -o revanced.apk ${INCLUDE_PATCHES} ${EXCLUDE_PATCHES} -c 2>&1 | tee -a Patch.log

