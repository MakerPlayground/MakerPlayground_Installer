#!/bin/sh

# remove old application bundle if exist
rm -rf MakerPlayground.app
# create new application bundle from the template
cp -r template.app MakerPlayground.app
# copy the image generate from jlink into the new application bundle
cp -r image/conf MakerPlayground.app/Contents/Plugins/Java.runtime/Contents/Home
cp -r image/legal MakerPlayground.app/Contents/Plugins/Java.runtime/Contents/Home
cp -r image/lib MakerPlayground.app/Contents/Plugins/Java.runtime/Contents/Home
cp image/release MakerPlayground.app/Contents/Plugins/Java.runtime/Contents/Home
cp image/lib/jli/libjli.dylib MakerPlayground.app/Contents/Plugins/Java.runtime/Contents/MacOS
# copy the library to the application bundle
cp -r library MakerPlayground.app/Contents/Resources
# signed the app bundle
# codesign --deep --force --verbose --sign "..." MakerPlayground.app
# verify the app bundle
codesign --verify -vvvv MakerPlayground.app
spctl -a -vvvv MakerPlayground.app