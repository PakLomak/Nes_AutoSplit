
state("qFceux", "2.6.4")
{
byte level: "qfceux.exe", 0x0318340, 0xE9;
byte location: "qfceux.exe", 0x0318340, 0x33;
byte lvl_cln: "qfceux.exe", 0x0318340, 0xC9;
byte boss_final_hp: "qfceux.exe", 0x0318340, 0x3FC;
byte start: "qfceux.exe", 0x0318340, 0x1ED;
byte power: "qfceux.exe", 0x0318340, 0xB4;
byte range: "qfceux.exe", 0x0318340, 0xB5;
}
state("Mesen", "0.9.9")
{
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xE9;
byte location: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x33;
byte lvl_cln: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xC9;
byte boss_final_hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3FC;
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1ED;
byte power: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB4;
byte range: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB5;
}
state("Mesen", "2.0.0")
{
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0xE9;
byte location: "MesenCore.dll", 0x440EF98, 0x4A0, 0x33;
byte lvl_cln: "MesenCore.dll", 0x440EF98, 0x4A0, 0xC9;
byte boss_final_hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3FC;
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1ED;
byte power: "MesenCore.dll", 0x440EF98, 0x4A0, 0xB4;
byte range: "MesenCore.dll", 0x440EF98, 0x4A0, 0xB5;
}
state("Mednafen", "0.9.48")
{
byte level: "mednafen.exe", 0x136E7E9;
byte location: "mednafen.exe", 0x136E733;
byte lvl_cln: "mednafen.exe", 0x136E7C9;
byte boss_final_hp: "mednafen.exe", 0x136EAFC;
byte start: "mednafen.exe", 0x136E8ED;
byte power: "mednafen.exe", 0x136E7B4;
byte range: "mednafen.exe", 0x136E7B5;
}
state("Mednafen", "1.29.0")
{
byte level: "mednafen.exe", 0x1667629;
byte location: "mednafen.exe", 0x1667573;
byte lvl_cln: "mednafen.exe", 0x1667609;
byte boss_final_hp: "mednafen.exe", 0x166793C;
byte start: "mednafen.exe", 0x166772D;
byte power: "mednafen.exe", 0x16675F4;
byte range: "mednafen.exe", 0x16675F5;
}
state("Nestopia", "1.40")
{
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x151;
byte location: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x9B;
byte lvl_cln: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x131;
byte boss_final_hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x464;
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x255;
byte power: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x11C;
byte range: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x11D;
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

startup
{
	settings.Add("main", false, "AutoSplitter for Little Mermaid by Zhrakula & PakLomak");
	settings.Add("main2", false, "--https://www.twitch.tv/zhrakula", "main");
	settings.Add("main3", false, "--https://www.twitch.tv/PakLomak", "main");
	settings.Add("options", true, "Options");
    settings.Add("boss_before", false, "Split before Boss", "options");
	settings.Add("PR", false, "Split on Power & Range spheres", "options");
}

start
{
	return (current.level == 0x00 && current.boss_final_hp == 0x00 && current.start == 0xFC && old.start == 0x00);
}

reset
{
	return (current.level == 0x00 && current.boss_final_hp == 0x00 && current.start == 0x00);
}

split
{
	if (settings["boss_before"]) 
	{
		if (current.level == 0x00 && old.location == 0x0B && current.location == 0x0C) return true;
		if (current.level == 0x01 && old.location == 0x0B && current.location == 0x0C) return true;
		if (current.level == 0x02 && old.location == 0x0E && current.location == 0x0F) return true;
		if (current.level == 0x03 && old.location == 0x0A && current.location == 0x0B) return true;
		if (current.level == 0x04 && old.location == 0x10 && current.location == 0x11) return true;
	}
	if (old.lvl_cln == 0x02 && current.lvl_cln == 0x01) 
	{
		if (current.level == 0x00 && current.location == 0x0C) return true;
		if (current.level == 0x01 && current.location == 0x0C) return true;
		if (current.level == 0x02 && current.location == 0x0F) return true;
		if (current.level == 0x03 && current.location == 0x0B) return true;
		if (current.level == 0x04 && current.location == 0x11) return true;
	}
	if (current.level == 0x05 && current.boss_final_hp == 0x00 && old.boss_final_hp > 0x00) return true;
	if (settings["PR"])
	{
		if (current.power == old.power + 1) return true;
		if (current.range == old.range + 1) return true;
	}
}
