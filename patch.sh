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
java -jar ${R_CLI} patch ${YOUTUBE_APK} -b ${R_PATCHES} -m ${R_INTEGRATIONS} -o revanced.apk ${INCLUDE_PATCHES} ${EXCLUDE_PATCHES} 2>&1 | tee -a Patch.log

