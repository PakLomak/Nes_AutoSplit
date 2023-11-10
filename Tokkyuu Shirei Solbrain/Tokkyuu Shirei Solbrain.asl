state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x20;
byte choose_lvl: "fceux64.exe", 0x04D59E0, 0x41;
byte level: "fceux64.exe", 0x04D59E0, 0x55;
byte boss: "fceux64.exe", 0x04D59E0, 0x650;
byte reset: "fceux64.exe", 0x04D59E0, 0x2A;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x20;
byte choose_lvl: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x41;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x55;
byte boss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x650;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2A;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x20;
byte choose_lvl: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x41;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x55;
byte boss: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x650;
byte reset: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x2A;
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
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x20;
byte choose_lvl: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x41;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x55;
byte boss: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x650;
byte reset: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x2A;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x20;
byte choose_lvl: "retroarch.exe", 0x0E88F38, 0x408, 0x41;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x55;
byte boss: "retroarch.exe", 0x0E88F38, 0x408, 0x650;
byte reset: "retroarch.exe", 0x0E88F38, 0x408, 0x2A;
}

start
{
	return (old.start == 0x90 && current.start == 0x40 && current.level == 0x00);
}
init
{
int memSize = modules.First().ModuleMemorySize;
switch (memSize)
{
	case 91533312:
		print("Detected Mednafen 1.29.0");
		version = "1.29.0";
		break;
	case 90116096:
		print("Detected Mednafen 1.27.1");
		version = "1.27.1";
		break;
	case 93294592:
		print("Detected Mednafen 0.9.48");
		version = "0.9.48";
		break;
	case 11714560:
		print("Detected Mesen 0.9.9");
		version = "0.9.9";
		break;
	case 10412032:
		print("Detected Mesen 0.9.8");
		version = "0.9.8";
		break;
	case 10067968:
		print("Detected Mesen 0.9.7");
		version = "0.9.7";
		break;
	case 196608:
		print("Detected Mesen 2.0.0");
		version = "2.0.0";
		break;
	case 5283840:
		print("Detected Mesen 0.0.6");
		version = "0.0.6";
		break;
	case 8069120:
		print("Detected FCEUX 2.6.6");
		version = "2.6.6";
		break;
	case 2113536:
		print("Detected Nestopia 1.40");
		version = "1.40";
		break;
	case 1974272:
		print("Detected Nestopia 1.52");
		version = "1.52";
		break;
	default:
		print("Unknown Emulator");
		version = "";
		break;
}
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
