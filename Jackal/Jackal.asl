state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x3B;
byte level: "qfceux.exe", 0x0318340, 0x30;
byte fight: "qfceux.exe", 0x0318340, 0x3C;
byte lives: "qfceux.exe", 0x0318340, 0x31;
byte end: "qfceux.exe", 0x0318340, 0x73F;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3B;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x30;
byte fight: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3C;
byte lives: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x31;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x73F;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3B;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x30;
byte fight: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3C;
byte lives: "MesenCore.dll", 0x440EF98, 0x4A0, 0x31;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x73F;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E73B;
byte level: "mednafen.exe", 0x136E730;
byte fight: "mednafen.exe", 0x136E73C;
byte lives: "mednafen.exe", 0x136E731;
byte end: "mednafen.exe", 0x136EE3F;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166757B;
byte level: "mednafen.exe", 0x1667570;
byte fight: "mednafen.exe", 0x166757C;
byte lives: "mednafen.exe", 0x1667571;
byte end: "mednafen.exe", 0x1667C7F;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA3;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x98;
byte fight: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA4;
byte lives: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x99;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7A7;
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
start
{
    return (old.start == 0x00 && current.start == 0xFF && current.level == 0x00);
}
split
{
    if (current.level == old.level +1) return true;
    if (current.level == 0x05 && current.start == 0x01 && old.end != 0xF0 && current.end == 0xF0) return true;
    if (settings["BB"] && old.fight == 0x00 && current.fight == 0x01) return true;
}
reset
{
    return (current.lives == 0x00 && current.level == 0x00);
}
startup 
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Jackal by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("BB", false, "Before boss", "options");
}