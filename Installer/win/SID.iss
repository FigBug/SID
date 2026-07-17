; SID installer (Inno Setup)

#define MyAppName "SID"
#define MyAppCompany "SocaLabs"
#define MyAppPublisher "SocaLabs"
#define MyAppCopyright "2026 SocaLabs"
#define MyAppURL "https://socalabs.com/"
#define MyAppVersion GetStringFileInfo("bin\VST3\SID.vst3\Contents\x86_64-win\SID.vst3", "ProductVersion")
#define MyDefaultDirName "{commoncf64}\VST3"

[Setup]
AppID={{26291ADE-1980-49FA-860C-CD73335746D7}
AppName={#MyAppCompany} {#MyAppName} {#MyAppVersion}
AppVerName={#MyAppCompany} {#MyAppName} {#MyAppVersion}
AppVersion={#MyAppVersion}
AppCopyright={#MyAppCopyright}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={#MyDefaultDirName}
DisableProgramGroupPage=yes
OutputDir=.\bin
OutputBaseFilename=SID
Compression=lzma/ultra
SolidCompression=true
ShowLanguageDialog=auto
LicenseFile=..\EULA.rtf
InternalCompressLevel=ultra
MinVersion=0,6.1.7600
FlatComponentsList=false
AppendDefaultDirName=false
AlwaysShowDirOnReadyPage=yes
DirExistsWarning=no
DisableDirPage=yes
DisableWelcomePage=no
DisableReadyPage=no
DisableReadyMemo=no
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
VersionInfoVersion={#MyAppVersion}
VersionInfoCompany={#MyAppPublisher}
VersionInfoCopyright={#MyAppCopyright}
VersionInfoProductName={#MyAppCompany} {#MyAppName} {#MyAppVersion} (64-bit)
VersionInfoProductVersion={#MyAppVersion}
VersionInfoProductTextVersion={#MyAppVersion}
UsePreviousGroup=False
Uninstallable=no
PrivilegesRequired=admin

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Components]
Name: "vst";       Description: "VST plug-in";   Types: full custom; Flags: checkablealone
Name: "vst3";      Description: "VST3 plug-in";  Types: full custom; Flags: checkablealone
Name: "clap";      Description: "CLAP plug-in";  Types: full custom; Flags: checkablealone
Name: "resources"; Description: "Factory presets"; Types: full custom; Flags: fixed
Name: "crashreporter"; Description: "Crash reporter (shared component, only updated if newer)"; Types: full custom; Flags: checkablealone

[InstallDelete]
Type: files;          Name: "{commoncf64}\VST2\SID.dll";   Components: vst
Type: filesandordirs; Name: "{commoncf64}\VST3\SID.vst3"; Components: vst3
Type: files;          Name: "{commoncf64}\CLAP\SID.clap"; Components: clap
Type: filesandordirs; Name: "{commonappdata}\SocaLabs\SID\Presets";        Components: resources

[Files]
Source: "bin\VST\SID.dll";    DestDir: "{commoncf64}\VST2";                     Flags: ignoreversion overwritereadonly; Components: vst
Source: "bin\VST3\SID.vst3\*"; DestDir: "{commoncf64}\VST3\SID.vst3\"; Flags: ignoreversion overwritereadonly recursesubdirs; Components: vst3
Source: "bin\CLAP\SID.clap";   DestDir: "{commoncf64}\CLAP";                    Flags: ignoreversion overwritereadonly; Components: clap
Source: "..\_flat_presets\*.xml"; DestDir: "{commonappdata}\SocaLabs\SID\Presets\"; Flags: ignoreversion; Components: resources
; CrashReporter app -> C:\Program Files\Rabien Software\Crash Reporter, plus this
; plugin's registration JSON -> C:\ProgramData\Rabien Software\Crash Reporter\Plugins.
; Shared across plugins: only updated if newer, never removed on uninstall.
Source: "bin\CrashReporter\CrashReporter.exe"; DestDir: "{commonpf}\Rabien Software\Crash Reporter"; Flags: skipifsourcedoesntexist uninsneveruninstall; Components: crashreporter
Source: "bin\CrashReporter\sid.json";    DestDir: "{commonappdata}\Rabien Software\Crash Reporter\Plugins"; Flags: ignoreversion uninsneveruninstall
