#!/bin/bash
#
## Build ReVanced
#

# Vars
WRK_DIR=$(pwd)
# Youtube apk
Y_APK_URL="https://td.sohil876.workers.dev/0:/youtube_17.29.34.apk"
Y_APK="youtube.apk"
# Revanced patches
R_PATCHES_URL="https://github.com/revanced/revanced-patches/releases/download/v2.25.2/revanced-patches-2.25.2.jar"
R_PATCHES="patches.jar"
# Revanced integrations
R_INTEGRATIONS_URL="https://github.com/revanced/revanced-integrations/releases/download/v0.28.1/app-release-unsigned.apk"
R_INTEGRATIONS="integrations.apk"
# Revanced patcher
R_PATCHER_URL="https://github.com/revanced/revanced-patcher"
# Revanced cli
R_CLI_URL="https://github.com/revanced/revanced-cli"
R_CLI="revanced-cli*-all.jar"

# Fetch files
echo ""
echo "Fetching files and repos..."
echo ""
wget ${Y_APK_URL} -O ${Y_APK}
wget ${R_PATCHES_URL} -O ${R_PATCHES}
wget ${R_INTEGRATIONS_URL} -O ${R_INTEGRATIONS}
git clone ${R_PATCHER_URL} patcher
git clone ${R_CLI_URL} cli

# Source build
export GITHUB_TOKEN=${GHTOKEN}
# Build patcher
echo ""
echo "Building patcher from source..."
echo ""
cd patcher
chmod +x gradlew
./gradlew publishToMavenLocal
# Build cli
echo ""
echo "Building cli from source..."
echo ""
cd ${WRK_DIR}/cli
chmod +x gradlew
./gradlew build
cp build/libs/*-all.jar ${WRK_DIR}/

# Patch revanced
echo ""
echo "Patching youtube apk..."
echo ""
cd ${WRK_DIR}
java -jar ${R_CLI} -a ${Y_APK} -b ${R_PATCHES} -m ${R_INTEGRATIONS} -o revanced.apk -i enable-wide-searchbar -e force-vp9-codec -c 2>&1 | tee -a Patch.log
# Remove published patcher
rm -rf ~/.m2/repository/app/revanced/*

