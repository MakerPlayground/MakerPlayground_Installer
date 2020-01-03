@echo off

if [%1]==[] exit /b 1

:: download WinPython
curl -L https://github.com/winpython/winpython/releases/download/1.7.20170401/WinPython-32bit-2.7.13.1Zero.exe --output WinPython-32bit-2.7.13.1Zero.exe

:: extract WinPython
start /WAIT WinPython-32bit-2.7.13.1Zero.exe /S
del WinPython-32bit-2.7.13.1Zero.exe
move WinPython-32bit-2.7.13.1Zero\python-2.7.13 .\python-2.7.13
rmdir /s /q WinPython-32bit-2.7.13.1Zero

:: install platformio
python-2.7.13\python.exe -m pip install platformio

:: install platformio dependencies (compilers, upload tools etc.)
cd testproject
..\python-2.7.13\python.exe -m platformio run --target upload
cd ..\

:: invoke innosetup to create the installer
iscc /Qp /DMyAppVersion=%1 MakerPlayground.iss
iscc /Qp /DMyAppVersion=%1 MakerPlayground_Minimal.iss
iscc /Qp /DMyAppVersion=%1 MakerPlayground_Update.iss
iscc /Qp /DMyAppVersion=%1 MakerPlayground_Library.iss