#define MyAppName "Maker Playground"
#define MyAppVersion "0.4.0-beta4"
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
DefaultDirName={sd}\{#MyAppName}
DisableProgramGroupPage=yes
DisableWelcomePage=no
ChangesAssociations=yes
OutputBaseFilename=MakerPlayground-{#MyAppVersion}
SetupIconFile=MakerPlayground.ico
WizardSmallImageFile={#WizardSmallImagePath}\55.bmp,{#WizardSmallImagePath}\64.bmp,{#WizardSmallImagePath}\83.bmp,{#WizardSmallImagePath}\92.bmp, \
                {#WizardSmallImagePath}\110.bmp,{#WizardSmallImagePath}\119.bmp,{#WizardSmallImagePath}\138.bmp
WizardImageFile={#WizardImagePath}\164.bmp,{#WizardImagePath}\192.bmp,{#WizardImagePath}\246.bmp,{#WizardImagePath}\273.bmp, \
                {#WizardImagePath}\328.bmp,{#WizardImagePath}\355.bmp,{#WizardImagePath}\410.bmp
SolidCompression=yes
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: mpFileAssociation; Description: "Associate ""mp"" extension"; GroupDescription: File extensions:
                                     
[Files]
Source: "makerplayground.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "mp.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\image\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\library\*"; DestDir: "{app}\library"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "platformio\*"; DestDir: "{app}\platformio"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "python-2.7.13\*"; DestDir: "{app}\python-2.7.13"; Flags: ignoreversion recursesubdirs createallsubdirs

; Prior to version 0.3, Maker Playgound creates and stores python at ~\.makerplayground so we delete this folder automatically
[InstallDelete]
Type: filesandordirs; Name: "{%USERPROFILE}\.makerplayground"

; Prior to version 0.3, Maker Playgound extracts file required by platformio at ~\.platformio. However, some users may have installed platformio
; by themselves ealier and thus have this folder in their PC so we ask for user confirmation before we delete this folder
[Code]
procedure CurStepChanged(CurStep: TSetupStep);
begin
  if (CurStep = ssInstall) and DirExists(ExpandConstant('{%USERPROFILE}\.platformio')) then
  begin
    if MsgBox(ExpandConstant('Do you want to delete files/folders created by previous version of Maker Playground found at {%USERPROFILE}\.platformio?'), mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = IDYES then
    begin
        DelTree(ExpandConstant('{%USERPROFILE}\.platformio'), True, True, True);
    end;
  end;
end;

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: shellexec postinstall skipifsilent

[Registry]
Root: HKLM; Subkey: "Software\Classes\.mp"; ValueType: string; ValueName: ""; ValueData: "MakerPlayground"; Flags: uninsdeletevalue; Tasks: mpFileAssociation
Root: HKLM; Subkey: "Software\Classes\MakerPlayground"; ValueType: string; ValueName: ""; ValueData: "Maker Playground"; Flags: uninsdeletekey; Tasks: mpFileAssociation
Root: HKLM; Subkey: "Software\Classes\MakerPlayground\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\mp.ico,0"; Tasks: mpFileAssociation
Root: HKLM; Subkey: "Software\Classes\MakerPlayground\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\makerplayground.EXE"" ""%1"""; Tasks: mpFileAssociation