state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x3B;
byte level: "fceux64.exe", 0x04D59E0, 0x30;
byte fight: "fceux64.exe", 0x04D59E0, 0x3C;
byte lives: "fceux64.exe", 0x04D59E0, 0x31;
byte end: "fceux64.exe", 0x04D59E0, 0x73F;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3B;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x30;
byte fight: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3C;
byte lives: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x31;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x73F;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3B;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x30;
byte fight: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3C;
byte lives: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x31;
byte end: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x73F;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3B;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x30;
byte fight: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3C;
byte lives: "MesenCore.dll", 0x440EF98, 0x4A0, 0x31;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x73F;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E73B;
byte level: "mednafen.exe", 0x136E730;
byte fight: "mednafen.exe", 0x136E73C;
byte lives: "mednafen.exe", 0x136E731;
byte end: "mednafen.exe", 0x136EE3F;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166757B;
byte level: "mednafen.exe", 0x1667570;
byte fight: "mednafen.exe", 0x166757C;
byte lives: "mednafen.exe", 0x1667571;
byte end: "mednafen.exe", 0x1667C7F;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA3;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x98;
byte fight: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA4;
byte lives: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x99;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7A7;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3B;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x30;
byte fight: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3C;
byte lives: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x31;
byte end: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x73F;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x3B;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x30;
byte fight: "retroarch.exe", 0x0E88F38, 0x408, 0x3C;
byte lives: "retroarch.exe", 0x0E88F38, 0x408, 0x31;
byte end: "retroarch.exe", 0x0E88F38, 0x408, 0x73F;
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
    return (old.start == 0x00 && current.start == 0xFF && current.level == 0x00);
}
split
{
    if (current.level == old.level +1) return true;
    if (current.level == 0x05 && current.start == 0x01 && old.end != 0xF0 && current.end == 0xF0) return true;
    if (settings["BB"] && old.fight == 0x00 && current.fight == 0x01) return true;
}
reset
{
    return (current.lives == 0x00 && current.level == 0x00);
}
startup 
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Jackal by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("BB", false, "Before boss", "options");
}
