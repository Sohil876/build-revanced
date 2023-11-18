### Config
## Vars
# Build from source and use it instead of prebuilts
SOURCE_BUILD_CLI="false"
SOURCE_BUILD_MANAGER="false" # (Compose)
# Explictly include/exclude patches
INCLUDE_PATCHES="-i custom-branding" # -i some-patch-name, typically its same as patchname on revanced git/site just all lowercase with space replaced by "-" symbol.
EXCLUDE_PATCHES="" # -e some-patch-name, typically its same as patchname on revanced git/site just all lowercase with space replaced by "-" symbol.
# Versions to fetch files for prebuilt from github releases
R_PATCHES_VERSION="2.197.0"
R_INTEGRATIONS_VERSION="0.122.0"
R_CLI_VERSION="4.1.0"
Y_APK_VERSION="18.38.44"
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

