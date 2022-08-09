#!/bin/bash
#
## Build ReVanced
#

# Vars (DO NOT CHANGE!)
export GITHUB_TOKEN=${GHTOKEN}
WRK_DIR=$(pwd)
# File names
YOUTUBE_APK="youtube.apk"
R_PATCHES="patches.jar"
R_INTEGRATIONS="integrations.apk"
R_CLI="revanced-cli*-all.jar"
# Git repos for source buids
R_PATCHER_GIT_URL="https://github.com/revanced/revanced-patcher"
R_CLI_GIT_URL="https://github.com/revanced/revanced-cli"
# Load conf file
source conf.sh

# Fetch files
echo ""
echo "Fetching files and repos..."
echo ""
wget ${YOUTUBE_APK_URL} -O ${YOUTUBE_APK}
wget ${R_PATCHES_URL} -O ${R_PATCHES}
wget ${R_INTEGRATIONS_URL} -O ${R_INTEGRATIONS}
if [ "${SOURCE_BUILD_CLI}" = false ] || [ "${SOURCE_BUILD_CLI}" = False ] || [ "${SOURCE_BUILD_CLI}" = FALSE ]; then
  wget ${R_CLI_URL}
elif [ "${SOURCE_BUILD_CLI}" = true ] || [ "${SOURCE_BUILD_CLI}" = True ] || [ "${SOURCE_BUILD_CLI}" = TRUE ]; then
  git clone ${R_PATCHER_GIT_URL} patcher
  git clone ${R_CLI_GIT_URL} cli
else
  echo "Invalid value in SOURCE_BUILD_CLI var!"
  echo "Allowed values true/True/TRUE or false/False/FALSE"
  exit 1
fi

if [ "${SOURCE_BUILD_CLI}" = true ] || [ "${SOURCE_BUILD_CLI}" = True ] || [ "${SOURCE_BUILD_CLI}" = TRUE ]; then
  # Build patcher
  echo ""
  echo "Source build enabled!"
  echo ""
  echo "Building patcher..."
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
  # Remove locally published patcher
  rm -rf ~/.m2/repository/app/revanced/*
fi

# Patch revanced
echo ""
echo "Patching youtube apk..."
echo ""
cd ${WRK_DIR}
java -jar ${R_CLI} -a ${YOUTUBE_APK} -b ${R_PATCHES} -m ${R_INTEGRATIONS} -o revanced.apk ${INCLUDE_PATCHES} ${EXCLUDE_PATCHES} -c 2>&1 | tee -a Patch.log

