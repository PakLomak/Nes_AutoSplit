state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x62;
byte screen: "fceux64.exe", 0x04D59E0, 0xD9;
byte music: "fceux64.exe", 0x04D59E0, 0x410;
byte hp_boss: "fceux64.exe", 0x04D59E0, 0xEE;
byte level: "fceux64.exe", 0x04D59E0, 0x31;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x62;
byte screen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xD9;
byte music: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x410;
byte hp_boss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xEE;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x31;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x62;
byte screen: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xD9;
byte music: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x410;
byte hp_boss: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xEE;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x31;
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
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x62;
byte screen: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xD9;
byte music: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x410;
byte hp_boss: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xEE;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x31;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x62;
byte screen: "retroarch.exe", 0x0E88F38, 0x408, 0xD9;
byte music: "retroarch.exe", 0x0E88F38, 0x408, 0x410;
byte hp_boss: "retroarch.exe", 0x0E88F38, 0x408, 0xEE;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x31;
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
