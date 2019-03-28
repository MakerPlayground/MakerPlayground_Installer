#!/bin/sh

if [ "$1" == "" ]; then
    echo "Usage: ./createappbundle.sh version_number"
    exit 1
fi

# install packages (original download url: http://s.sudre.free.fr/Software/files/Packages.dmg)
curl -O https://makerplayground.blob.core.windows.net/tool/macos/Packages.dmg
hdiutil attach Packages.dmg
sudo installer -pkg /Volumes/Packages\ 1.2.5/Install\ Packages.pkg -target "/"
hdiutil detach /Volumes/Packages\ 1.2.5
rm Packages.dmg

# install platformio
sudo /usr/bin/python -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"

# generate platformio dependency
cd testproject
/usr/bin/python -m platformio run --target upload
cd ../
chmod -R 777 platformio

# signed the app bundle
codesign --deep --force --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app

# verify the app bundle
codesign --verify -vvvv Maker\ Playground.app
spctl -a -vvvv Maker\ Playground.app

# replace the version number in packages project file
sed -i '' "s/\${MP_BUILD_VERSION}/$1/g" MakerPlayground_Installer.pkgproj

# build the pkg installer
packagesbuild MakerPlayground_Installer.pkgproj

# sign the pkg installer
cd build
productsign --sign "Developer ID Installer: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED (8YJDH97D29)" MakerPlayground-$1.pkg MakerPlayground-$1-signed.pkg
mv MakerPlayground-$1-signed.pkg MakerPlayground-$1.pkg
cd ../