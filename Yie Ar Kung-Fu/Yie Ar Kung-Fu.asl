state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x0;
byte level: "qfceux.exe", 0x0318340, 0x61;
byte bonus: "qfceux.exe", 0x0318340, 0x64;
byte hp: "qfceux.exe", 0x0318340, 0xDC;
byte dead: "qfceux.exe", 0x0318340, 0x44;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x0;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x61;
byte bonus: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x64;
byte hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xDC;
byte dead: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x44;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x0;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x61;
byte bonus: "MesenCore.dll", 0x440EF98, 0x4A0, 0x64;
byte hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0xDC;
byte dead: "MesenCore.dll", 0x440EF98, 0x4A0, 0x44;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E700;
byte level: "mednafen.exe", 0x136E761;
byte bonus: "mednafen.exe", 0x136E764;
byte hp: "mednafen.exe", 0x136E7DC;
byte dead: "mednafen.exe", 0x136E744;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667540;
byte level: "mednafen.exe", 0x16675A1;
byte bonus: "mednafen.exe", 0x16675A4;
byte hp: "mednafen.exe", 0x166761C;
byte dead: "mednafen.exe", 0x1667584;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x68;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xC9;
byte bonus: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xCC;
byte hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x144;
byte dead: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xAC;
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
    return (old.start == 0x01 && current.start == 0x03);
}
split
{
	if (settings["level_split"] && current.level == old.level + 1 && current.level != 0x01 && current.level != 0x0A && current.level != 0x0f) return true;
	if (settings["Bonus"] && current.level == 0x03 && old.bonus == 0x00 && current.bonus == 0x01) return true;
	if (settings["Bonus_2"] && current.level == 0x08 && old.bonus == 0x00 && current.bonus == 0x01) return true;
	if (settings["Bonus_3"] && current.level == 0x0D && old.bonus == 0x00 && current.bonus == 0x01) return true;
    if (settings["1st_loop"] && current.level == 0x05 && old.hp == 0x08 && current.hp == 0x09) return true; //Mu
	if (settings["2nd_loop"] && current.level == 0x0A && old.hp == 0x08 && current.hp == 0x09) return true; //Mu
	if (settings["3nd_loop"] && current.level == 0x0F && old.hp == 0x08 && current.hp == 0x09) return true; //Mu
}
startup
{
	settings.Add("main", false, "AutoSplitter for Yie Ar Kung-Fu by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("level_split", true, "Split by Level", "options");
	settings.Add("Bonus", false, "Split by bonus", "options");
	settings.Add("1st_loop", true, "1st loop", "options");
	settings.Add("Bonus_2", false, "Split by bonus 2 loop", "options");
	settings.Add("2nd_loop", true, "2nd loop", "options");
	settings.Add("Bonus_3", false, "Split by bonus 3nd loop", "options");
	settings.Add("3nd_loop", true, "3md loop", "options");
}
reset
{
	return (current.start == 0x00 && current.level == 0x00 && current.dead == 0x00);
}
