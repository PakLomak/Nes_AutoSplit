state("fceux", "2.2.3") //RAM 0x00 == 0x3B1388, 0x000;
{
	byte start:0x3B1388, 0x20;
    byte choose_lvl:0x3B1388, 0x41;
	byte level:0x3B1388, 0x55;
	byte boss:0x3B1388, 0x650;
	byte reset:0x3B1388, 0x2A;
	byte portal:0x3B1388, 0x45;
}
state("fceux", "2.4.0") //RAM 0x00 == 0x44DCD8, 0x000;
{
	byte start:0x44DCD8, 0x20;
    byte choose_lvl:0x44DCD8, 0x41;
	byte level:0x44DCD8, 0x55;
	byte boss:0x44DCD8, 0x650;
	byte reset:0x44DCD8, 0x2A;
	byte portal:0x44DCD8, 0x45;
}
state("mesen", "v0.9.9") //RAM 0x00 == "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x00;
{
	byte start:"MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x20;
	byte choose_lvl:"MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x41;
	byte level:"MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x55;
	byte boss:"MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x650;
	byte reset:"MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2A;
	byte portal:"MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x45;
}
state("mesen", "v0.9.8") //RAM 0x00 == "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x00;
{
	byte start:"MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x20;
	byte choose_lvl:"MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x41;
	byte level:"MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x55;
	byte boss:"MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x650;
	byte reset:"MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x2A;
	byte portal:"MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x45;
}
state("mednafen", "1.27.1") //RAM 0x00 == 0x1711540;
{
	byte start:"mednafen.exe", 0x1711560;
	byte choose_lvl:"mednafen.exe", 0x1711581;
	byte level:"mednafen.exe", 0x1711595;
	byte boss:"mednafen.exe", 0x1711B90;
	byte reset:"mednafen.exe", 0x171156A;
	byte portal:"mednafen.exe", 0x1711585;
}
state("mednafen", "0.9.48") //RAM 0x00 == 0x136E700;
{
	byte start:"mednafen.exe", 0x136E720;
	byte choose_lvl:"mednafen.exe", 0x136E741;
	byte level:"mednafen.exe", 0x136E755;
	byte boss:"mednafen.exe", 0x136ED50;
	byte reset:"mednafen.exe", 0x136E72A;
	byte portal:"mednafen.exe", 0x136E745;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x20;
byte choose_lvl: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x41;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x55;
byte boss: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x650;
byte reset: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x2A;
byte portal: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x45;
}
start
{
	if (old.start == 0x90 && current.start == 0x40 && current.level == 0x00)
	{
		vars.infernon = true;
		vars.balzire = true;
		vars.gravitus = true;
		return true;
	}
}
init
{
    if (modules.First().ModuleMemorySize == 90116096)
        version = "1.27.1";
    else if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
    if (modules.First().ModuleMemorySize == 11714560)
        version = "v0.9.9";
    else if (modules.First().ModuleMemorySize == 10412032)
        version = "v0.9.8";
    if (modules.First().ModuleMemorySize == 4747264)
        version = "2.2.3";
    else if (modules.First().ModuleMemorySize == 6705152)
        version = "2.4.0";
	vars.infernon = true;
	vars.balzire = true;
	vars.gravitus = true;
}
split
{
	if (settings["level_split"] && old.choose_lvl != 0x5E && current.choose_lvl == 0x5E) return(true);
	if (current.boss == 0xB0 && old.boss != 0xB0 || current.boss == 0xF0 && old.boss!= 0xF0) return(true); // General Grover
	if (settings["Before_boss"] && current.portal == 0x0C && old.portal != 0x0C) return(true);
	if (settings["boss_split"] && current.boss == 0x9B && old.boss != 0x9B && current.level == 0x08) return(true); //Balzire
	if (settings["boss_rush"] && current.boss == 0x9B && old.boss != 0x9B && current.level == 0x0F && vars.balzire == true)		{vars.balzire = false;
	return true;}; //Balzire Area G
	if (settings["boss_split"] && current.boss == 0x9E && old.boss != 0x9E && current.level == 0x0C) return(true); //Gravitus
	if (settings["boss_rush"] && current.boss == 0x9E && old.boss != 0x9E && current.level == 0x0F && vars.gravitus == true)	{vars.gravitus = false;
	return true;}; //Gravitus Area G 
	if (settings["boss_split"] && current.boss == 0xA1 && old.boss != 0xA1 && current.level == 0x0D) return(true); //Infernon
	if (settings["boss_rush"] && current.boss == 0xAD && old.boss != 0xAD && current.level == 0x0F && vars.infernon =+ true)	{vars.infernon = false;
	return true;} //Infernon Area G
	if (settings["boss_split"] && current.boss == 0xA6 && old.boss != 0xA6 && current.level == 0x0E) return(true); //Pogoborgs
	if (settings["boss_split"] && current.boss == 0xAA && old.boss != 0xAA && current.level == 0x12) return(true); //Cyborgape
	if (settings["boss_split"] && current.boss == 0xAC && old.boss != 0xAC && current.level == 0x11) return(true); // Harptune
		else return(false);
}
reset
{
	return (old.reset != 0xCC && current.reset == 0xCC);
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
