state("Fceux64", "2.6.6")
{
byte sublevel: "fceux64.exe", 0x04D59E0, 0xF3;
byte level: "fceux64.exe", 0x04D59E0, 0xF4;
byte brett: "fceux64.exe", 0x04D59E0, 0x46;
byte end: "fceux64.exe", 0x04D59E0, 0xF6;
byte x: "fceux64.exe", 0x04D59E0, 0x405;
}
state("Mesen", "0.9.9")
{
byte sublevel: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xF3;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xF4;
byte brett: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x46;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xF6;
byte x: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x405;
}
state("Mesen", "0.0.6")
{
byte sublevel: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xF3;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xF4;
byte brett: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x46;
byte end: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xF6;
byte x: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x405;
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
state("Nestopia", "1.52")
{
byte sublevel: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xF3;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xF4;
byte brett: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x46;
byte end: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xF6;
byte x: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x405;
}
state("Retroarch", "Mesen")
{
byte sublevel: "retroarch.exe", 0x0E88F38, 0x408, 0xF3;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0xF4;
byte brett: "retroarch.exe", 0x0E88F38, 0x408, 0x46;
byte end: "retroarch.exe", 0x0E88F38, 0x408, 0xF6;
byte x: "retroarch.exe", 0x0E88F38, 0x408, 0x405;
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
