#!/bin/sh

if [ "$1" == "" ]; then
    echo "Usage: ./createappbundle.sh version_number"
    exit 1
fi

# install packages
wget https://github.com/MakerPlayground/MakerPlayground_Installer_Dependency/releases/download/v1.0.0/Packages.dmg
hdiutil attach Packages.dmg
sudo installer -pkg /Volumes/Packages\ 1.2.10/Install\ Packages.pkg -target "/"
hdiutil detach /Volumes/Packages\ 1.2.10
rm Packages.dmg

# install python, neccessary build tools (esp32 (micropython) and k210) and platformio
wget https://github.com/MakerPlayground/MakerPlayground_Installer_Dependency/releases/download/v1.0.0/python-portable-darwin_x86_64.tar.gz
mkdir python-portable-darwin_x86_64
tar -xf python-portable-darwin_x86_64.tar.gz -C python-portable-darwin_x86_64
rm python-portable-darwin_x86_64.tar.gz
python-portable-darwin_x86_64/bin/python3.9 -m pip install --upgrade platformio esptool pyserial pyelftools kflash

# download ampy
git clone https://github.com/scientifichackers/ampy.git
cd ampy
../python-portable-darwin_x86_64/bin/python3.9 setup.py install
cd ../
rm -rf ampy

# signed python
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/site-packages/yaml/_yaml.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/binascii.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/binascii.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/bin/python3.9
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_codecs_cn.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_uuid.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_md5.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_sqlite3.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/pyexpat.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/grp.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_bz2.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/mmap.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_xxsubinterpreters.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/array.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/parser.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_pickle.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_posixsubprocess.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_ctypes_test.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_crypt.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_lzma.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/fcntl.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/audioop.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/readline.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_hashlib.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_blake2.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/resource.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_xxtestfuzz.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_posixshmem.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/xxlimited.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_testimportmultiple.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/zlib.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/termios.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_decimal.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_sha1.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_codecs_kr.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_bisect.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_scproxy.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/syslog.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_datetime.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_asyncio.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_curses_panel.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_testinternalcapi.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_queue.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_elementtree.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_codecs_iso2022.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/cmath.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_codecs_hk.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_multibytecodec.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_json.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_zoneinfo.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_contextvars.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_statistics.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_struct.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_ctypes.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_heapq.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_codecs_jp.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_csv.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_gdbm.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_testmultiphase.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_lsprof.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/unicodedata.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_sha256.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_testbuffer.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_opcode.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_tkinter.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_curses.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/math.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_multiprocessing.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_sha512.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_sha3.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_testcapi.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/nis.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/select.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_dbm.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_codecs_tw.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_random.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/lib-dynload/_socket.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/site-packages/_cffi_backend.cpython-39-darwin.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/site-packages/cryptography/hazmat/bindings/_padding.abi3.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/site-packages/cryptography/hazmat/bindings/_openssl.abi3.so
codesign --deep --force --timestamp --options runtime -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" python-portable-darwin_x86_64/lib/python3.9/site-packages/cryptography/hazmat/bindings/_rust.abi3.so

# signed the app bundle
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/bin/jrunscript
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/bin/java
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/bin/keytool
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libnet.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libnio.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libzip.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libfreetype.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libjli.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libsplashscreen.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libjimage.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libosxui.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libawt_lwawt.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libjavajpeg.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libmlib_image.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libjsound.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libjsig.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libprefs.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libjawt.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libfontmanager.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/jspawnhelper
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libosxsecurity.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/liblcms.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libverify.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libjava.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libawt.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libosx.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/libosxapp.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/server/libjvm.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/Home/lib/server/libjsig.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/MacOS/Maker\ Playground
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/MacOS/libjli.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app

# verify the app bundle
codesign -vvv --deep --strict Maker\ Playground.app
spctl -vvv --assess --type exec Maker\ Playground.app

# replace the version number in packages project file
sed -i '' "s/\${MP_BUILD_VERSION}/$1/g" MakerPlayground_Installer.pkgproj

# copy the library directory (excluding *.ai, *.svg, and other unnecessary files)
rsync -az --exclude='.git*' --exclude='.vscode' --exclude='/build.py' --exclude='*.ai' --exclude='*.svg' ../../library/ ./library

# build the pkg installer
packagesbuild MakerPlayground_Installer.pkgproj

# sign the pkg installer
cd build
productsign --sign "Developer ID Installer: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED (8YJDH97D29)" MakerPlayground-$1.pkg MakerPlayground-$1-signed.pkg
mv MakerPlayground-$1-signed.pkg MakerPlayground-$1.pkg

# notarization the installer
xcrun notarytool submit MakerPlayground-$1.pkg --apple-id palmnuntipat@hotmail.com --team-id 8YJDH97D29 --password "$APPLE_APP_SPECIFIC_PASS" --wait
if [ $? -ne 0 ]; then
    echo "Error: Can't submit bundle and retrieve notarization request uuid"
    exit 1
fi

echo "Staple notarization ticket to the application installer"
xcrun stapler staple -v MakerPlayground-$1.pkg

cd ../
echo "Staple notarization ticket to the application bundle"
xcrun stapler staple -v Maker\ Playground.app

# distribute final app bundle as zip archive as GitHub release doesn't support directory as release artifact
ditto -c -k --keepParent Maker\ Playground.app build/Maker\ Playground.app.zip