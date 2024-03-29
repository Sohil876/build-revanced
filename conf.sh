### Config
## Vars
# Build from source and use it instead of prebuilts
SOURCE_BUILD_CLI="false"
SOURCE_BUILD_MANAGER="false" # (Compose)
# Explictly include/exclude patches
# You can get index of patch from patches.json using jq:
# jq 'map(.name == "Custom branding") | index(true)' < patches.json
INCLUDE_PATCHES="--ii 77" # --ii patchindex.
EXCLUDE_PATCHES="" # --ie patchindex.
# Versions to fetch files for prebuilt from github releases
R_PATCHES_VERSION="4.4.0"
R_INTEGRATIONS_VERSION="1.6.0"
R_CLI_VERSION="4.5.0"
Y_APK_VERSION="19.09.37"
# File links
YOUTUBE_APK_URL="https://td.sohil876.workers.dev/1:/ReVanced/youtube_${Y_APK_VERSION}.apk"
###


### DO NOT CHANGE!
## Vars
# File names
YOUTUBE_APK="youtube.apk"
R_PATCHES="patches.jar"
R_INTEGRATIONS="integrations.apk"
R_CLI="revanced-cli-*-all.jar"
###

