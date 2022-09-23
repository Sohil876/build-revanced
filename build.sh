#!/usr/bin/env bash
#
## Build ReVanced
#

# Vars (DO NOT CHANGE!)
source conf.sh # Load conf file
export GITHUB_TOKEN=${GHTOKEN}
WRK_DIR=$(pwd)

# Build
if [ "${SOURCE_BUILD_CLI^^}" = TRUE ]; then
  # Build patcher
  echo ""
  echo "Source build enabled!"
  echo ""
  echo "Building patcher..."
  echo ""
  cd ${WRK_DIR}/patcher
  chmod +x gradlew
  ./gradlew clean publishToMavenLocal
  # Build cli
  echo ""
  echo "Building cli from source..."
  echo ""
  cd ${WRK_DIR}/cli
  chmod +x gradlew
  ./gradlew clean build
  cp build/libs/${R_CLI} ${WRK_DIR}/
  # Remove locally published patcher
  rm -rf ~/.m2/repository/app/revanced
fi

