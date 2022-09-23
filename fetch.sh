#!/usr/bin/env bash
#
## Build ReVanced
#

# Vars (DO NOT CHANGE!)
source conf.sh # Load conf file
export GITHUB_TOKEN=${GHTOKEN}
# Prebuilt file links, configure versions in conf.sh file
R_PATCHES_URL="https://github.com/revanced/revanced-patches/releases/download/v${R_PATCHES_VERSION}/revanced-patches-${R_PATCHES_VERSION}.jar"
R_INTEGRATIONS_URL="https://github.com/revanced/revanced-integrations/releases/download/v${R_INTEGRATIONS_VERSION}/app-release-unsigned.apk"
if [ "${SOURCE_BUILD_CLI^^}" = FALSE ]; then
  R_CLI_URL="https://github.com/revanced/revanced-cli/releases/download/v${R_CLI_VERSION}/revanced-cli-${R_CLI_VERSION}-all.jar"
elif [ "${SOURCE_BUILD_CLI^^}" = TRUE ]; then
  # Git repos for source buids
  R_PATCHER_GIT_URL="https://github.com/revanced/revanced-patcher"
  R_CLI_GIT_URL="https://github.com/revanced/revanced-cli"
else
  echo "Invalid value in SOURCE_BUILD_CLI var!"
  echo "Allowed values true/True/TRUE or false/False/FALSE"
  exit 1
fi

# Fetch files
echo ""
echo "Fetching files and repos..."
echo ""
wget ${YOUTUBE_APK_URL} -O ${YOUTUBE_APK}
wget ${R_PATCHES_URL} -O ${R_PATCHES}
wget ${R_INTEGRATIONS_URL} -O ${R_INTEGRATIONS}
if [ "${SOURCE_BUILD_CLI^^}" = FALSE ]; then
  wget ${R_CLI_URL}
elif [ "${SOURCE_BUILD_CLI^^}" = TRUE ]; then
  git clone ${R_PATCHER_GIT_URL} patcher
  git clone ${R_CLI_GIT_URL} cli
else
  echo "Invalid value in SOURCE_BUILD_CLI var!"
  echo "Allowed values true/True/TRUE or false/False/FALSE"
  exit 1
fi

