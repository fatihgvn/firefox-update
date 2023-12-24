#!/bin/bash

# Defaults
OS="linux64"
LANG="en-US"

if [ $# -eq 2 ]; then
    OS=$1
    LANG=$2
fi

URL="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=${OS}&lang=${LANG}"

TARGET_DIR="/opt"

TEMP_DIR=$(mktemp -d)

echo "$URL"
echo "Downloading..."
wget -O "$TEMP_DIR/firefox.tar.bz2" "$URL"

echo "Extracting..."
tar -xjf "$TEMP_DIR/firefox.tar.bz2" -C "$TARGET_DIR"

echo "Clear temp..."
rm -rf "$TEMP_DIR"

echo "Firefox Developer Edition updated."
echo "Done."
