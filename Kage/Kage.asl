state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0xB4;
byte input: "qfceux.exe", 0x0318340, 0x6;
byte number: "qfceux.exe", 0x0318340, 0x2;
byte level: "qfceux.exe", 0x0318340, 0x40;
byte hp: "qfceux.exe", 0x0318340, 0x7F8;
byte boss: "qfceux.exe", 0x0318340, 0x7F9;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB4;
byte input: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x6;
byte number: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x40;
byte hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x7F8;
byte boss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x7F9;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0xB4;
byte input: "MesenCore.dll", 0x440EF98, 0x4A0, 0x6;
byte number: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x40;
byte hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0x7F8;
byte boss: "MesenCore.dll", 0x440EF98, 0x4A0, 0x7F9;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E7B4;
byte input: "mednafen.exe", 0x136E706;
byte number: "mednafen.exe", 0x136E702;
byte level: "mednafen.exe", 0x136E740;
byte hp: "mednafen.exe", 0x136EEF8;
byte boss: "mednafen.exe", 0x136EEF9;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675F4;
byte input: "mednafen.exe", 0x1667546;
byte number: "mednafen.exe", 0x1667542;
byte level: "mednafen.exe", 0x1667580;
byte hp: "mednafen.exe", 0x1667D38;
byte boss: "mednafen.exe", 0x1667D39;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x11C;
byte input: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6E;
byte number: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6A;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA8;
byte hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x860;
byte boss: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x861;
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
    return(old.start == 0x9E && current.start == 0x1A && current.input == 0x10);
}
reset
{
    return(current.start == 0x99 && current.number == 0xA5);
}
split
{
    if (settings["level_split"] && current.level == old.level + 1 ) return true;
    if (settings["Boss_split"] && old.level == 0x03 && current.level == 0x04) return true;
    if (settings["Boss_split"] && old.level == 0x06 && current.level == 0x07) return true;
    if (settings["Boss_split"] && old.level == 0x09 && current.level == 0x0A) return true;
    if (settings["Boss_split"] && old.level == 0x0C && current.level == 0x0D) return true;
    if (current.level == 0x0E && current.boss == 0x13 && old.hp == 0x01 && current.hp == 0x00) return true;
}
startup
{
	settings.Add("main", false, "AutoSplitter for Kage by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("level_split", false, "Split by levels", "options");
	settings.Add("Boss_split", true, "Split by boss", "options");
}