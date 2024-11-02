#!/bin/bash
XLCORE=https://github.com/goatcorp/XIVLauncher.Core/releases/download/1.1.1/XIVLauncher.Core.tar.gz
APPIMGBLDR=https://github.com/AppImageCrafters/appimage-builder/releases/download/v1.1.0/appimage-builder-1.1.0-x86_64.AppImage
ARIA=https://github.com/rankynbass/aria2-static-build/releases/latest/download/aria2-static.tar.gz

# Get XLCore
curl -L "$XLCORE" -o XIVLauncher.Core.tar.gz
curl -L "$ARIA" -o aria2-static.tar.gz
rm -rf AppDir/*
mkdir -p AppDir/opt/xivlauncher-core
tar -xf XIVLauncher.Core.tar.gz -C AppDir/opt/xivlauncher-core
tar -xf aria2-static.tar.gz -C AppDir/opt/xivlauncher-core
mkdir -p AppDir/usr/share/icons/hicolor/256x256/apps
cp xivlauncher.png AppDir/usr/share/icons/hicolor/256x256/apps/xivlauncher.png

# Get appimage-builder
curl -L $APPIMGBLDR -o appimage-builder
chmod +x appimage-builder