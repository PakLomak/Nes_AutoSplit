state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x62;
byte screen: "qfceux.exe", 0x0318340, 0xD9;
byte music: "qfceux.exe", 0x0318340, 0x410;
byte hp_boss: "qfceux.exe", 0x0318340, 0xEE;
byte level: "qfceux.exe", 0x0318340, 0x31;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x62;
byte screen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xD9;
byte music: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x410;
byte hp_boss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xEE;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x31;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x62;
byte screen: "MesenCore.dll", 0x440EF98, 0x4A0, 0xD9;
byte music: "MesenCore.dll", 0x440EF98, 0x4A0, 0x410;
byte hp_boss: "MesenCore.dll", 0x440EF98, 0x4A0, 0xEE;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x31;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E762;
byte screen: "mednafen.exe", 0x136E7D9;
byte music: "mednafen.exe", 0x136EB10;
byte hp_boss: "mednafen.exe", 0x136E7EE;
byte level: "mednafen.exe", 0x136E731;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675A2;
byte screen: "mednafen.exe", 0x1667619;
byte music: "mednafen.exe", 0x1667950;
byte hp_boss: "mednafen.exe", 0x166762E;
byte level: "mednafen.exe", 0x1667571;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xCA;
byte screen: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x141;
byte music: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x478;
byte hp_boss: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x156;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x99;
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
    return (old.start == 0x07 && current.start == 0x00 && current.screen == 0x01);
}
split
{
    if (settings["Before_boss"] && old.screen != 0x0F && current.screen == 0x0F) return true;
    if (current.screen == 0x02 && old.music <= 0x2A && current.music == 0x2B) return true;
    if (current.level == 0x06 && current.screen == 0x0F && current.hp_boss >= 0x10) return true;
}
reset
{
    return (current.screen == 0xF0 && old.screen == 0xF0);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Darkwing Duck by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("Before_boss", false, "Split before boss", "options");
}
