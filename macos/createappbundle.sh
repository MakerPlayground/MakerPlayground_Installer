#!/bin/sh

if [ "$1" == "" ]; then
    echo "Usage: ./createappbundle.sh version_number"
    exit 1
fi

# install packages (original download url: http://s.sudre.free.fr/Software/files/Packages.dmg)
curl -O https://makerplayground.blob.core.windows.net/tool/macos/Packages.dmg
hdiutil attach Packages.dmg
sudo installer -pkg /Volumes/Packages\ 1.2.9/Install\ Packages.pkg -target "/"
hdiutil detach /Volumes/Packages\ 1.2.9
rm Packages.dmg

# install python, neccessary build tools (esp32 (micropython) and k210) and platformio
curl https://dl.registry.platformio.org/download/platformio/tool/python-portable/1.30902.0/python-portable-darwin_x86_64-1.30902.0.tar.gz -L --output python-portable-darwin_x86_64.tar.gz
mkdir python-portable-darwin_x86_64
tar -xf python-portable-darwin_x86_64.tar.gz -C python-portable-darwin_x86_64
rm python-portable-darwin_x86_64.tar.gz
python-portable-darwin_x86_64/bin/python3.9 -m pip install platformio esptool pyserial pyelftools kflash

# download ampy
git clone https://github.com/scientifichackers/ampy.git
cd ampy
../python-portable-darwin_x86_64/bin/python3.9 setup.py install
cd ../
rm -rf ampy

# signed python
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

# generate platformio dependency
cd testproject
../python-portable-darwin_x86_64/bin/python3.9 -m platformio run --target upload
cd ../
rm -rf platformio/.cache
chmod -R 777 platformio

# signed platformio binary (generated by generate_pio_codegen.py)
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/tool-mkspiffs/mkspiffs
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/tool-mkspiffs/mkspiffs_espressif32_arduino
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/tool-mkspiffs/mkspiffs_espressif32_espidf
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/tool-mkspiffs/mkspiffs_espressif8266_arduino
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/avr/bin/objdump
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/avr/bin/strip
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/avr/bin/ld
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/avr/bin/readelf
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/avr/bin/ld.bfd
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/avr/bin/nm
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/avr/bin/ar
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/avr/bin/as
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/avr/bin/objcopy
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/avr/bin/ranlib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-objdump
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-c++filt
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-ld.bfd
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-gcov-dump
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-gcc-nm
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-gcc-ar
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-addr2line
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-strings
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-readelf
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-gcc-ranlib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-cpp
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-ld
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-elfedit
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-gcov
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-gcc-7.3.0
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-size
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-gcc
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-as
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-ranlib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-nm
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-ar
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-c++
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-objcopy
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-gdb
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-strip
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-gcov-tool
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-g++
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/bin/avr-gprof
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/libexec/gcc/avr/7.3.0/lto1
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/libexec/gcc/avr/7.3.0/lto-wrapper
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/libexec/gcc/avr/7.3.0/cc1plus
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/libexec/gcc/avr/7.3.0/liblto_plugin.0.so
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/libexec/gcc/avr/7.3.0/collect2
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/libexec/gcc/avr/7.3.0/cc1
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/libexec/gcc/avr/7.3.0/plugin/gengtype
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/libexec/gcc/avr/7.3.0/install-tools/fixincl
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/lib/libcc1.0.so
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/lib/gcc/avr/7.3.0/plugin/libcc1plugin.0.so
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-atmelavr/lib/gcc/avr/7.3.0/plugin/libcp1plugin.0.so
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-cpp
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-gcov-tool
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-strings
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-gcov
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-c++filt
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-objdump
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-gprof
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-ar
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-readelf
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-nm
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-strip
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-ranlib
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-as
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-elfedit
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-gcc-ranlib
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-ld
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-g++
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-c++
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-gcc-5.2.0
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-gdb
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-addr2line
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-objcopy
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-gcc
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-ld.bfd
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-size
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-gcc-ar
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-gcc-nm
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/xtensa-esp32-elf/bin/objdump
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/xtensa-esp32-elf/bin/strip
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/xtensa-esp32-elf/bin/ld
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/xtensa-esp32-elf/bin/ld.bfd
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/xtensa-esp32-elf/bin/nm
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/xtensa-esp32-elf/bin/ar
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/xtensa-esp32-elf/bin/as
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/xtensa-esp32-elf/bin/objcopy
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/xtensa-esp32-elf/bin/ranlib
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/libexec/gcc/xtensa-esp32-elf/5.2.0/lto1
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/libexec/gcc/xtensa-esp32-elf/5.2.0/lto-wrapper
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/libexec/gcc/xtensa-esp32-elf/5.2.0/cc1plus
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/libexec/gcc/xtensa-esp32-elf/5.2.0/liblto_plugin.0.so
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/libexec/gcc/xtensa-esp32-elf/5.2.0/collect2
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/libexec/gcc/xtensa-esp32-elf/5.2.0/cc1
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/libexec/gcc/xtensa-esp32-elf/5.2.0/plugin/gengtype
# codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa32/libexec/gcc/xtensa-esp32-elf/5.2.0/install-tools/fixincl
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-objcopy
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-ld
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-size
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-addr2line
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-ld.bfd
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-cpp
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-gcc-ar
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-gcc-nm
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-strip
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-gprof
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-readelf
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-elfedit
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-gcc
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-gcc-ranlib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-objdump
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-c++filt
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-ar
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-nm
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-as
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-gcc-4.8.2
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-c++
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-ranlib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-gdb
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-gcov
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-strings
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-g++
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/g++
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/c++
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/objdump
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/strip
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/ld
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/readelf
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/gcc
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/ld.bfd
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/nm
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/ar
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/as
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/objcopy
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/xtensa-lx106-elf/bin/ranlib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/libexec/gcc/xtensa-lx106-elf/4.8.2/lto1
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/libexec/gcc/xtensa-lx106-elf/4.8.2/lto-wrapper
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/libexec/gcc/xtensa-lx106-elf/4.8.2/cc1plus
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/libexec/gcc/xtensa-lx106-elf/4.8.2/liblto_plugin.0.so
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/libexec/gcc/xtensa-lx106-elf/4.8.2/collect2
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/libexec/gcc/xtensa-lx106-elf/4.8.2/cc1
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/libexec/gcc/xtensa-lx106-elf/4.8.2/plugin/gengtype
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-xtensa/libexec/gcc/xtensa-lx106-elf/4.8.2/install-tools/fixincl
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/tool-esptool/esptool
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/tool-mkspiffs@1.200.0/mkspiffs
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/tool-avrdude/bin/avrdude
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/tool-mklittlefs/mklittlefs
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/tool-bossac@1.10700.190624/bossac
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-gcov-tool
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-gcov
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-gcc-ar
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-cpp
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-gcc-nm
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-gcc-ranlib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-strings
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-gcc
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-c++filt
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-gprof
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-gdb-py
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-gdb
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-addr2line
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-c++
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-gcov-dump
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-size
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-elfedit
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/arm-none-eabi/bin/objdump
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/arm-none-eabi/bin/strip
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/arm-none-eabi/bin/ld
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/arm-none-eabi/bin/readelf
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/arm-none-eabi/bin/nm
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/arm-none-eabi/bin/ar
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/arm-none-eabi/bin/as
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/arm-none-eabi/bin/objcopy
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/arm-none-eabi/bin/ranlib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/lib/libcc1.0.so
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/lib/gcc/arm-none-eabi/7.2.1/lto1
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/lib/gcc/arm-none-eabi/7.2.1/lto-wrapper
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/lib/gcc/arm-none-eabi/7.2.1/cc1plus
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/lib/gcc/arm-none-eabi/7.2.1/liblto_plugin.0.so
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/lib/gcc/arm-none-eabi/7.2.1/collect2
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/lib/gcc/arm-none-eabi/7.2.1/cc1
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/lib/gcc/arm-none-eabi/7.2.1/plugin/libcc1plugin.0.so
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/lib/gcc/arm-none-eabi/7.2.1/plugin/gengtype
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/lib/gcc/arm-none-eabi/7.2.1/plugin/libcp1plugin.0.so
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/toolchain-gccarmnoneeabi/lib/gcc/arm-none-eabi/7.2.1/install-tools/fixincl
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt -vvv --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" platformio/packages/tool-bossac/bossac

# signed the app bundle
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/MacOS/Maker\ Playground
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app/Contents/runtime/Contents/MacOS/libjli.dylib
codesign --deep --force --timestamp --options runtime --entitlements entitlements.txt --verbose --sign "Developer ID Application: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED" Maker\ Playground.app

# verify the app bundle
codesign -vvv --deep --strict Maker\ Playground.app
spctl -vvv --assess --type exec Maker\ Playground.app

# replace the version number in packages project file
sed -i '' "s/\${MP_BUILD_VERSION}/$1/g" MakerPlayground_Installer.pkgproj
sed -i '' "s/\${MP_BUILD_VERSION}/$1/g" MakerPlayground_Full_Installer.pkgproj

# copy the library directory (excluding *.ai, *.svg, and other unnecessary files)
rsync -az --exclude='.git*' --exclude='.vscode' --exclude='/build.py' --exclude='*.ai' --exclude='*.svg' ../../library/ ./library

# build the pkg installer
packagesbuild MakerPlayground_Installer.pkgproj
packagesbuild MakerPlayground_Full_Installer.pkgproj

# sign the pkg installer
cd build
productsign --sign "Developer ID Installer: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED (8YJDH97D29)" MakerPlayground-$1.pkg MakerPlayground-$1-signed.pkg
productsign --sign "Developer ID Installer: INGARAGE ASSISTIVE TECHNOLOGY COMPANY LIMITED (8YJDH97D29)" MakerPlayground-Full-$1.pkg MakerPlayground-Full-$1-signed.pkg
mv MakerPlayground-$1-signed.pkg MakerPlayground-$1.pkg
mv MakerPlayground-Full-$1-signed.pkg MakerPlayground-Full-$1.pkg

# pack both pkg installers for notarization
zip -r MakerPlayground-$1.zip MakerPlayground-$1.pkg MakerPlayground-Full-$1.pkg

# notarization the installer
echo "Get notarization request uuid..."
notarize_req_uid=$(xcrun altool --notarize-app \
   -f MakerPlayground-$1.zip \
   --primary-bundle-id io.makerplayground \
   --username palmnuntipat@hotmail.com --password @env:APPLE_ID_PASSWORD \
   --asc-provider 8YJDH97D29 \
   | grep RequestUUID | awk '{print $3}')
echo "RequestUUID = $notarize_req_uid"
if [ -z "$notarize_req_uid" ]; then
    echo "Error: Can't submit bundle and retrieve notarization request uuid"
    exit 1
fi

echo "Poll the server every minute until success..."
while :
do
   notarize_status=$(xcrun altool --notarization-info "$notarize_req_uid" \
       -u palmnuntipat@hotmail.com --password @env:APPLE_ID_PASSWORD)
   echo "$notarize_status"
   if [[ "$notarize_status" == *"Status: success"* ]]; then
       break
   elif [[ "$notarize_status" == *"Status: in progress"* ]]; then
       sleep 60
   elif [[ "$notarize_status" == *"Status: invalid"* ]]; then
       exit 1
   else
       sleep 60
   fi
done

echo "Staple notarization ticket to the application installer"
xcrun stapler staple -v MakerPlayground-$1.pkg
xcrun stapler staple -v MakerPlayground-Full-$1.pkg

cd ../
echo "Staple notarization ticket to the application bundle"
xcrun stapler staple -v Maker\ Playground.app
