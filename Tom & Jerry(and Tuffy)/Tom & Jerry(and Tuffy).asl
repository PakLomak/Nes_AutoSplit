state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x1E7;
byte start2: "qfceux.exe", 0x0318340, 0x1F0;
byte start3: "qfceux.exe", 0x0318340, 0x1F2;
byte magic: "qfceux.exe", 0x0318340, 0x4C4;
byte level2: "qfceux.exe", 0x0318340, 0x2;
byte level3: "qfceux.exe", 0x0318340, 0x3;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1E7;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1F0;
byte start3: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1F2;
byte magic: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4C4;
byte level2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2;
byte level3: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1E7;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1F0;
byte start3: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1F2;
byte magic: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4C4;
byte level2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2;
byte level3: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E8E7;
byte start2: "mednafen.exe", 0x136E8F0;
byte start3: "mednafen.exe", 0x136E8F2;
byte magic: "mednafen.exe", 0x136EBC4;
byte level2: "mednafen.exe", 0x136E702;
byte level3: "mednafen.exe", 0x136E703;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667727;
byte start2: "mednafen.exe", 0x1667730;
byte start3: "mednafen.exe", 0x1667732;
byte magic: "mednafen.exe", 0x1667A04;
byte level2: "mednafen.exe", 0x1667542;
byte level3: "mednafen.exe", 0x1667543;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x24F;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x258;
byte start3: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x25A;
byte magic: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x52C;
byte level2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6A;
byte level3: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B;
}
start
{
    if (current.level3 == 0x01 && current.start == 0x05 && current.start2 == 0x02 && current.start3 == 0x10) return(true);
}
split
{
    if (current.level2 == 0x25 && old.level2 != 0x25 && current.level3 == 0x02 && current.magic == 0x01) return(true);
    if (old.level2 == 0xD3 && current.level2 == 0xC2 && current.level3 == 0xFA) return(true);
}
init
{
    if (modules.First().ModuleMemorySize == 91533312)
		version = "1.29.0";
    else if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
	if (modules.First().ModuleMemorySize == 11714560)
        version = "0.9.9";
	else if (modules.First().ModuleMemorySize == 196608) 
        version = "2.0.0";
}
reset
{
    return (current.level2 == 0x5A && current.level3 == 0xAA);
}
startup
{
    refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Tom & Jerry and Tuffy by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
