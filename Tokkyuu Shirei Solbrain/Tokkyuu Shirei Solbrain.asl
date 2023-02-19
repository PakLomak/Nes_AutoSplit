state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x20;
byte choose_lvl: "qfceux.exe", 0x0318340, 0x41;
byte level: "qfceux.exe", 0x0318340, 0x55;
byte boss: "qfceux.exe", 0x0318340, 0x650;
byte reset: "qfceux.exe", 0x0318340, 0x2A;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x20;
byte choose_lvl: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x41;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x55;
byte boss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x650;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2A;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x20;
byte choose_lvl: "MesenCore.dll", 0x440EF98, 0x4A0, 0x41;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x55;
byte boss: "MesenCore.dll", 0x440EF98, 0x4A0, 0x650;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2A;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E720;
byte choose_lvl: "mednafen.exe", 0x136E741;
byte level: "mednafen.exe", 0x136E755;
byte boss: "mednafen.exe", 0x136ED50;
byte reset: "mednafen.exe", 0x136E72A;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667560;
byte choose_lvl: "mednafen.exe", 0x1667581;
byte level: "mednafen.exe", 0x1667595;
byte boss: "mednafen.exe", 0x1667B90;
byte reset: "mednafen.exe", 0x166756A;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x88;
byte choose_lvl: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA9;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xBD;
byte boss: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B8;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x92;
}
start
{
	return (old.start == 0x90 && current.start == 0x40 && current.level == 0x00);
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
split
{
	if (settings["level_split"] && old.choose_lvl != 0x5E && current.choose_lvl == 0x5E) return(true);
	if (current.boss == 0xB0 && old.boss != 0xB0 || current.boss == 0xF0 && old.boss!= 0xF0) return(true); // General Grover
	if (settings["Before_boss"] && current.portal == 0x0C && old.portal != 0x0C) return(true);
	if (settings["boss_split"] && current.boss == 0x9B && old.boss != 0x9B && current.level == 0x08) return(true); //Balzire
	if (settings["boss_rush"] && current.boss == 0x9B && old.boss != 0x9B && current.level == 0x0F) return(true); //Balzire Area G
	if (settings["boss_split"] && current.boss == 0x9E && old.boss != 0x9E && current.level == 0x0C) return(true); //Gravitus
	if (settings["boss_rush"] && current.boss == 0x9E && old.boss != 0x9E && current.level == 0x0F) return(true); //Gravitus Area G 
	if (settings["boss_split"] && current.boss == 0xA1 && old.boss != 0xA1 && current.level == 0x0D) return(true); //Infernon
	if (settings["boss_rush"] && current.boss == 0xAD && old.boss != 0xAD && current.level == 0x0F) return(true); //Infernon Area G
	if (settings["boss_split"] && current.boss == 0xA5 && old.boss != 0xA5 && current.level == 0x12) return(true); //Pogoborgs
	if (settings["boss_split"] && current.boss == 0xAA && old.boss != 0xAA && current.level == 0x0E) return(true); //Cyborgape
	if (settings["boss_split"] && current.boss == 0xAC && old.boss != 0xAC && current.level == 0x11) return(true); // Harptune
		else return(false);
}
reset
{
	return (old.reset != 0xD1 && current.reset == 0xD1);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Shatterhand by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("level_split", true, "Split by levels", "options");
	settings.Add("Before_boss", false, "Before boss", "options");
	settings.Add("boss_split", false, "Split on boss death", "options");
	settings.Add("boss_rush", false, "Ebable 3 last bosses", "options");
}
