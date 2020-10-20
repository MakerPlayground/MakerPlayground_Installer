@echo off

if [%1]==[] exit /b 1

:: download WinPython
curl -L https://github.com/winpython/winpython/releases/download/2.3.20200319/Winpython32-3.7.7.0dot.exe --output Winpython32-3.7.7.0dot.exe

:: extract WinPython
start /WAIT Winpython32-3.7.7.0dot.exe -y
del Winpython32-3.7.7.0dot.exe
move WPy32-3770\python-3.7.7 .\python-3.7.7
rmdir /s /q WPy32-3770

:: install platformio
python-3.7.7\python.exe -m pip install platformio

:: install platformio dependencies (compilers, upload tools etc.)
cd testproject
..\python-3.7.7\python.exe -m platformio run --target upload
cd ..\

:: download ampy
git clone https://github.com/scientifichackers/ampy.git

:: install ampy
cd ampy
..\python-3.7.7\python.exe setup.py install
cd ..\
rmdir /s /q ampy

:: invoke innosetup to create the installer
iscc /Qp /DMyAppVersion=%1 MakerPlayground.iss