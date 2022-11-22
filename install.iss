[Setup]
AppName=DECtalk 4.99 SAPI5 New
AppVerName=DECtalk 4.99 SAPI5 New
DefaultDirName={pf}\DECtalk 4.99 SAPI5 New
OutputBaseFilename=DECtalk 4.99 SAPI5 New
Compression=lzma
SolidCompression=yes

[Files]
Source: "dtalk_us.dic"; DestDir: "{app}"
Source: "Release_x86\ttseng.dll"; DestDir: "{app}"; Flags: regserver ignoreversion

[Registry]
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\US"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\dtalk_us.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty"; ValueType: String; ValueData: "US Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty"; ValueName: "409"; ValueType: String; ValueData: "US Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty"; ValueName: "CLSID"; ValueType: String; ValueData: "{{33954DF7-7F4C-4027-8022-3B3474490393}"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty"; ValueName: "Voice"; ValueType: DWORD; ValueData: "1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis"; ValueType: String; ValueData: "US Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis"; ValueName: "409"; ValueType: String; ValueData: "US Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis"; ValueName: "CLSID"; ValueType: String; ValueData: "{{33954DF7-7F4C-4027-8022-3B3474490393}"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis"; ValueName: "Voice"; ValueType: DWORD; ValueData: "4"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank"; ValueType: String; ValueData: "US Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank"; ValueName: "409"; ValueType: String; ValueData: "US Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank"; ValueName: "CLSID"; ValueType: String; ValueData: "{{33954DF7-7F4C-4027-8022-3B3474490393}"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank"; ValueName: "Voice"; ValueType: DWORD; ValueData: "3"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry"; ValueType: String; ValueData: "US Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry"; ValueName: "409"; ValueType: String; ValueData: "US Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry"; ValueName: "CLSID"; ValueType: String; ValueData: "{{33954DF7-7F4C-4027-8022-3B3474490393}"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry"; ValueName: "Voice"; ValueType: DWORD; ValueData: "2"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit"; ValueType: String; ValueData: "US Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit"; ValueName: "409"; ValueType: String; ValueData: "US Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit"; ValueName: "CLSID"; ValueType: String; ValueData: "{{33954DF7-7F4C-4027-8022-3B3474490393}"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit"; ValueName: "Voice"; ValueType: DWORD; ValueData: "5"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Child"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul"; ValueType: String; ValueData: "US Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul"; ValueName: "409"; ValueType: String; ValueData: "US Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul"; ValueName: "CLSID"; ValueType: String; ValueData: "{{33954DF7-7F4C-4027-8022-3B3474490393}"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul"; ValueName: "Voice"; ValueType: DWORD; ValueData: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "VendorPreferred"; ValueType: String; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita"; ValueType: String; ValueData: "US Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita"; ValueName: "409"; ValueType: String; ValueData: "US Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita"; ValueName: "CLSID"; ValueType: String; ValueData: "{{33954DF7-7F4C-4027-8022-3B3474490393}"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita"; ValueName: "Voice"; ValueType: DWORD; ValueData: "7"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula"; ValueType: String; ValueData: "US Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula"; ValueName: "409"; ValueType: String; ValueData: "US Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula"; ValueName: "CLSID"; ValueType: String; ValueData: "{{33954DF7-7F4C-4027-8022-3B3474490393}"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula"; ValueName: "Voice"; ValueType: DWORD; ValueData: "6"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy"; ValueType: String; ValueData: "US Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy"; ValueName: "409"; ValueType: String; ValueData: "US Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy"; ValueName: "CLSID"; ValueType: String; ValueData: "{{33954DF7-7F4C-4027-8022-3B3474490393}"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy"; ValueName: "Voice"; ValueType: DWORD; ValueData: "8"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty
