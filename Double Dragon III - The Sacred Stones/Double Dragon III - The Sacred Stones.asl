state("qFceux", "2.6.4")
{
byte sublevel: "qfceux.exe", 0x0318340, 0xF3;
byte level: "qfceux.exe", 0x0318340, 0xF4;
byte brett: "qfceux.exe", 0x0318340, 0x46;
byte end: "qfceux.exe", 0x0318340, 0xF6;
byte x: "qfceux.exe", 0x0318340, 0x405;
}
state("Mesen", "0.9.9")
{
byte sublevel: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xF3;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xF4;
byte brett: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x46;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xF6;
byte x: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x405;
}
state("Mesen", "2.0.0")
{
byte sublevel: "MesenCore.dll", 0x440EF98, 0x4A0, 0xF3;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0xF4;
byte brett: "MesenCore.dll", 0x440EF98, 0x4A0, 0x46;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0xF6;
byte x: "MesenCore.dll", 0x440EF98, 0x4A0, 0x405;
}
state("Mednafen", "0.9.48")
{
byte sublevel: "mednafen.exe", 0x136E7F3;
byte level: "mednafen.exe", 0x136E7F4;
byte brett: "mednafen.exe", 0x136E746;
byte end: "mednafen.exe", 0x136E7F6;
byte x: "mednafen.exe", 0x136EB05;
}
state("Mednafen", "1.29.0")
{
byte sublevel: "mednafen.exe", 0x1667633;
byte level: "mednafen.exe", 0x1667634;
byte brett: "mednafen.exe", 0x1667586;
byte end: "mednafen.exe", 0x1667636;
byte x: "mednafen.exe", 0x1667945;
}
state("Nestopia", "1.40")
{
byte sublevel: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x15B;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x15C;
byte brett: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xAE;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x15E;
byte x: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x46D;
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
    return (current.sublevel == 0x00 && old.brett == 0x00 && current.brett == 0xCC);
}
split
{
    if (settings["level_split"] && current.level == old.level + 1) return true;
    if (settings["Pyramid"] && old.sublevel == 0x0A && current.sublevel == 0x0B) return true;
    if (settings["Marion_Tomb"] && old.sublevel == 0x0D && current.sublevel == 0x0E) return true;
    if (current.level == 0x04 && current.sublevel == 0x0E && old.end != 0x08 && current.end == 0x08) return true;
}
reset
{
    return (current.sublevel == 0x00 && current.x == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Double Dragon III - The Sacred Stones by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("level_split", true, "Split by levels", "options");
    settings.Add("Pyramid", false, "Enter Pyramid", "options");
    settings.Add("Marion_Tomb", false, "Marion Tomb", "options");
}