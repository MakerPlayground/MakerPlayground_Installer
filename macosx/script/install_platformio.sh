#!/bin/sh

# install pip
curl https://bootstrap.pypa.io/get-pip.py | python

# install platformio
python -m pip install platformio

# remove old platform io dependency folder
rm -rf "/Library/Application Support/MakerPlayground/platformio"