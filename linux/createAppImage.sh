#!/bin/sh

if [ "$1" = "" ]; then
    echo "Usage: ./createAppImage.sh version_number"
    exit 1
fi

# download appimagetool
wget "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
chmod a+x appimagetool-x86_64.AppImage

# copy all resources by following AppDir format (https://docs.appimage.org/packaging-guide/manual.html)
cd Maker\ Playground
cp ../assets/* ./
rsync -az --exclude='.git*' --exclude='.vscode' --exclude='/build.py' --exclude='*.ai' --exclude='*.svg' ../../../library/ ./library
ln -s bin/Maker\ Playground AppRun
cd ../

# build AppImage
./appimagetool-x86_64.AppImage -n ./Maker\ Playground/ MakerPlayground-$1.AppImage

# create tar archive as an alternative distribution format
mv Maker\ Playground/ MakerPlayground-$1/
tar -czf MakerPlayground-$1.tar.gz MakerPlayground-$1/

# cleanup
rm appimagetool-x86_64.AppImage