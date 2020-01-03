; This is a library only installer without the Maker Playground front-ended, integrated python, platformio library and device library

#define MyAppName "Maker Playground"
; MyAppVersion will be passed as an command line argument (/DMyAppVersion=...) 
; #define MyAppVersion ""
#define MyAppPublisher "InGarage Assistive Technology Co.,Ltd."
#define MyAppURL "www.makerplayground.io"
#define MyAppExeName "makerplayground.exe"
#define WizardImagePath ".\assets\wizardimagefile"
#define WizardSmallImagePath ".\assets\wizardsmallimagefile"

[Setup]
AppId={{io.makerplayground.ui}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autoappdata}\{#MyAppName}
DisableProgramGroupPage=yes
DisableWelcomePage=no
; don't allow user to change installation dir
DisableDirPage=yes
OutputBaseFilename=MakerPlayground-{#MyAppVersion}-lib
SetupIconFile=MakerPlayground.ico
; don't create uninstaller and new entry in Add/Remove Programs Control Panel
UpdateUninstallLogAppName=no
Uninstallable=no
CreateUninstallRegKey=no
WizardSmallImageFile={#WizardSmallImagePath}\55.bmp,{#WizardSmallImagePath}\64.bmp,{#WizardSmallImagePath}\83.bmp,{#WizardSmallImagePath}\92.bmp, \
                {#WizardSmallImagePath}\110.bmp,{#WizardSmallImagePath}\119.bmp,{#WizardSmallImagePath}\138.bmp
WizardImageFile={#WizardImagePath}\164.bmp,{#WizardImagePath}\192.bmp,{#WizardImagePath}\246.bmp,{#WizardImagePath}\273.bmp, \
                {#WizardImagePath}\328.bmp,{#WizardImagePath}\355.bmp,{#WizardImagePath}\410.bmp
SolidCompression=yes
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "..\..\library\*"; DestDir: "{autoappdata}\Maker Playground\library"; Flags: ignoreversion recursesubdirs createallsubdirs

[InstallDelete]
; delete old library
Type: filesandordirs; Name: "{autoappdata}\Maker Playground\library"