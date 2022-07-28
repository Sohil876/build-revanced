#!/bin/bash
#
## Build ReVanced
#

# Vars
export GITHUB_TOKEN=${GHTOKEN}
WRK_DIR=$(pwd)
YOUTUBE_APK="youtube.apk"
R_PATCHES="patches.jar"
R_INTEGRATIONS="integrations.apk"
R_CLI="revanced-cli*-all.jar"
source links.sh

# Fetch files
echo ""
echo "Fetching files and repos..."
echo ""
wget ${YOUTUBE_APK_URL} -O ${YOUTUBE_APK}
wget ${R_PATCHES_URL} -O ${R_PATCHES}
wget ${R_INTEGRATIONS_URL} -O ${R_INTEGRATIONS}
git clone ${R_PATCHER_URL} patcher
git clone ${R_CLI_URL} cli

# Source build
# Build patcher
echo ""
echo "Building patcher from source..."
echo ""
cd patcher
chmod +x gradlew
./gradlew clean publishToMavenLocal
# Build cli
echo ""
echo "Building cli from source..."
echo ""
cd ${WRK_DIR}/cli
chmod +x gradlew
./gradlew clean build
cp build/libs/*-all.jar ${WRK_DIR}/

# Patch revanced
echo ""
echo "Patching youtube apk..."
echo ""
cd ${WRK_DIR}
java -jar ${R_CLI} -a ${YOUTUBE_APK} -b ${R_PATCHES} -m ${R_INTEGRATIONS} -o revanced.apk -i enable-wide-searchbar -e force-vp9-codec -c 2>&1 | tee -a Patch.log
# Remove published patcher
rm -rf ~/.m2/repository/app/revanced/*

