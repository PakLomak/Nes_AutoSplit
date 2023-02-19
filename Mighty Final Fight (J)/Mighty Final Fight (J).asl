state("qFceux", "2.6.4")
{
byte screen: "qfceux.exe", 0x0318340, 0xE;
byte start: "qfceux.exe", 0x0318340, 0x1BC;
byte sublvl: "qfceux.exe", 0x0318340, 0x67;
byte end: "qfceux.exe", 0x0318340, 0x30;
byte t: "qfceux.exe", 0x0318340, 0x54;
byte bonus: "qfceux.exe", 0x0318340, 0xB2;
}
state("Mesen", "0.9.9")
{
byte screen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xE;
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1BC;
byte sublvl: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x67;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x30;
byte t: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x54;
byte bonus: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB2;
}
state("Mesen", "2.0.0")
{
byte screen: "MesenCore.dll", 0x440EF98, 0x4A0, 0xE;
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1BC;
byte sublvl: "MesenCore.dll", 0x440EF98, 0x4A0, 0x67;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x30;
byte t: "MesenCore.dll", 0x440EF98, 0x4A0, 0x54;
byte bonus: "MesenCore.dll", 0x440EF98, 0x4A0, 0xB2;
}
state("Mednafen", "0.9.48")
{
byte screen: "mednafen.exe", 0x136E70E;
byte start: "mednafen.exe", 0x136E8BC;
byte sublvl: "mednafen.exe", 0x136E767;
byte end: "mednafen.exe", 0x136E730;
byte t: "mednafen.exe", 0x136E754;
byte bonus: "mednafen.exe", 0x136E7B2;
}
state("Mednafen", "1.29.0")
{
byte screen: "mednafen.exe", 0x166754E;
byte start: "mednafen.exe", 0x16676FC;
byte sublvl: "mednafen.exe", 0x16675A7;
byte end: "mednafen.exe", 0x1667570;
byte t: "mednafen.exe", 0x1667594;
byte bonus: "mednafen.exe", 0x16675F2;
}
state("Nestopia", "1.40")
{
byte screen: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x76;
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x224;
byte sublvl: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xCF;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x98;
byte t: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xBC;
byte bonus: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x11A;
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
    return (current.screen == 0xA5 && old.start != 0xCB && current.start == 0xCB);
}
split
{
    if (settings["Screen"] && current.sublvl == old.sublvl + 1) return true;
    if (settings["Stage"] && old.sublvl == 0x02 && current.sublvl == 0x03) return true;
    if (settings["Bonus"] && current.sublvl == 0x05 && old.bonus == 0x00 && current.bonus == 0xFF) return true;
    if (settings["Stage"] && old.sublvl == 0x05 && current.sublvl == 0x06) return true;
    if (settings["Stage"] && old.sublvl == 0x08 && current.sublvl == 0x09) return true;
    if (settings["Bonus"] && current.sublvl == 0x0B && old.bonus == 0x00 && current.bonus == 0xFF) return true;
    if (settings["Stage"] && old.sublvl == 0x0B && current.sublvl == 0x0C) return true;
    if (current.sublvl == 0x0E && current.end == 0x0A && old.end != 0x0A && current.t >= 0x01) return true;
}
reset
{
    return (current.screen == 0xC5 && current.sublvl == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Mighty Final Fight by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("Stage", true, "Split by change stage", "options");
    settings.Add("Screen", false, "Split by change screen", "options");
    settings.Add("Bonus", false, "Split by bonus", "options");
}
