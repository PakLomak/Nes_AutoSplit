state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x0;
byte level: "fceux64.exe", 0x04D59E0, 0x61;
byte bonus: "fceux64.exe", 0x04D59E0, 0x64;
byte hp: "fceux64.exe", 0x04D59E0, 0xDC;
byte dead: "fceux64.exe", 0x04D59E0, 0x44;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x0;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x61;
byte bonus: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x64;
byte hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xDC;
byte dead: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x44;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x0;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x61;
byte bonus: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x64;
byte hp: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xDC;
byte dead: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x44;
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
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x0;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x61;
byte bonus: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x64;
byte hp: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xDC;
byte dead: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x44;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x0;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x61;
byte bonus: "retroarch.exe", 0x0E88F38, 0x408, 0x64;
byte hp: "retroarch.exe", 0x0E88F38, 0x408, 0xDC;
byte dead: "retroarch.exe", 0x0E88F38, 0x408, 0x44;
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
