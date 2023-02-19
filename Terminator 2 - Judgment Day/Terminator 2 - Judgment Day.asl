state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x1FC;
byte level: "qfceux.exe", 0x0318340, 0x718;
byte life: "qfceux.exe", 0x0318340, 0x71A;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1FC;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x718;
byte life: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x71A;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1FC;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x718;
byte life: "MesenCore.dll", 0x440EF98, 0x4A0, 0x71A;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E8FC;
byte level: "mednafen.exe", 0x136EE18;
byte life: "mednafen.exe", 0x136EE1A;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166773C;
byte level: "mednafen.exe", 0x1667C58;
byte life: "mednafen.exe", 0x1667C5A;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x264;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x780;
byte life: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x782;
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
    return (current.level == 0x01 && old.life == 0x00 && current.life >= 0x01 && current.start == 0x94);
}
split
{
    if (current.level <= 0x04 && old.start != 0x8C && current.start == 0x8C) return true;
    if (current.level == 0x05 && old.start != 0x2E && current.start == 0x2E) return true;
    if (current.level == 0x05 && old.start != 0x16 && current.start == 0x16) return true;
}
reset
{
    return (current.start == 0x4E);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Terminator 2 - Judgment Day by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}