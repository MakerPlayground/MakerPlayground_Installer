#!/bin/sh

# install platformio
python -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"

# remove old platform io dependency folder
rm -rf "/Library/Application Support/MakerPlayground/platformio"