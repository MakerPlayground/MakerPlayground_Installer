#!/bin/sh

# remove old platform io dependency folder
rm -rf "/Library/Application Support/MakerPlayground/platformio"

# try acquire latest version of the get-platformio.py script if we can't, use the local backup script
python -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)" --help
if [ $? -eq 0 ]; then
  python -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)" check core
  if [ $? -eq 0 ]; then
    echo "Skip platformio core installation"
  else
    echo "Installing platformio core..."
    python -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"
  fi
else
  echo "Using local get-platformio.py script..."
  python get-platformio.py check core
  if [ $? -eq 0 ]; then
    echo "Skip platformio core installation"
  else
    echo "Installing platformio core..."
    python get-platformio.py
  fi
fi

# install ampy
unzip ampy.zip
cd ampy
~/.platformio/penv/bin/python setup.py install
cd ../

# install esptool
~/.platformio/penv/bin/pip install esptool

# install kflash
~/.platformio/penv/bin/pip install pyserial pyelftools kflash
