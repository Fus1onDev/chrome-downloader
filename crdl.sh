#!/bin/bash

#Variables
MAC_INTEL_DMG="https://dl.google.com/chrome/mac/universal/stable/ggro/googlechrome.dmg"
MAC_ARM_DMG="https://dl.google.com/chrome/mac/universal/stable/chfa/googlechrome.dmg"
#MAC_INTEL_PKG=""
#MAC_ARM_PKG="https://dl.google.com/chrome/mac/universal/stable/gcem/googlechrome.pkg"

set -u

#Functions
abort() {
    printf "%s\n" "$@"
    exit 1
}

clear

#Title
echo -e "\033[1;32m -- Chrome Downloader -- \033[0;39m"
echo

#System Check
echo "🔍Checking Your System"

if [ -z "${BASH_VERSION:-}" ]
then
    abort "❌ Bash is required to interpret this script."
else
    echo "✔︎ Bash is Installed"
fi

OS="$(uname)"
if [[ "${OS}" == "Darwin" ]]
then
    echo "✔︎ Using macOS"
else
    abort "❌ This script is only supported on macOS."
fi

UNAME_MACHINE="$(/usr/bin/uname -m)"
if [[ "${UNAME_MACHINE}" == "arm64" ]]
then
    archit="Apple Silicon"
else
    archit="Intel Chip"
fi
echo "💻 Architecture: $archit"
echo

#Download
echo "Start downloading Google Chrome"

if [[ "${UNAME_MACHINE}" == "arm64" ]]
then
    #apple sillicon
    curl -OL# "$MAC_ARM_DMG"
else
    #intel chip
    curl -OL# "$MAC_INTEL_DMG"
fi

echo "✅ Download of Google Chrome is complete!"