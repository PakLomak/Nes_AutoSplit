state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x29;
byte level: "fceux64.exe", 0x04D59E0, 0x5D;
byte id: "fceux64.exe", 0x04D59E0, 0x5E;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x29;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x5D;
byte id: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x5E;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x29;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x5D;
byte id: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x5E;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x29;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x5D;
byte id: "MesenCore.dll", 0x440EF98, 0x4A0, 0x5E;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E729;
byte level: "mednafen.exe", 0x136E75D;
byte id: "mednafen.exe", 0x136E75E;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667569;
byte level: "mednafen.exe", 0x166759D;
byte id: "mednafen.exe", 0x166759E;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x91;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xC5;
byte id: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xC6;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x29;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x5D;
byte id: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x5E;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x29;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x5D;
byte id: "retroarch.exe", 0x0E88F38, 0x408, 0x5E;
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
    return (old.level == 0x00 && current.level == 0x01);
}
split
{
    if (settings["level_split"] && current.level == old.level + 1) return true;
    if (settings["Black_Screen_split"] && current.level == 0x01 && current.id == 0x17 && old.start == 0x03 && current.start == 0x07) return true;
    if (settings["Black_Screen_split"] && current.level == 0x02 && current.id == 0x15 && old.start == 0x03 && current.start == 0x07) return true;
    if (settings["Black_Screen_split"] && current.level == 0x03 && current.id == 0x17 && old.start == 0x03 && current.start == 0x07) return true;
    if (settings["Black_Screen_split"] && current.level == 0x04 && current.id == 0x15 && old.start == 0x03 && current.start == 0x07) return true;
    if (settings["Black_Screen_split"] && current.level == 0x05 && current.id == 0x19 && old.start == 0x03 && current.start == 0x07) return true;
    if (settings["Black_Screen_split"] && current.level == 0x06 && current.id == 0x18 && old.start == 0x03 && current.start == 0x07) return true;
    if (settings["Black_Screen_split"] && current.level == 0x07 && current.id == 0x17 && old.start == 0x03 && current.start == 0x07) return true;
    if (settings["Black_Screen_split"] && current.level == 0x08 && current.id == 0x16 && old.start == 0x03 && current.start == 0x07) return true;
    if (settings["Black_Screen_split"] && current.level == 0x09 && current.id == 0x14 && old.start == 0x03 && current.start == 0x07) return true;
    if (settings["Black_Screen_split"] && current.level == 0x0A && current.id == 0x17 && old.start == 0x03 && current.start == 0x07) return true;
    if (current.level == 0x0B && current.id == 0x0B && old.start == 0x03 && current.start == 0x07) return true;
}
reset
{
    return (current.start == 0x00 && current.level == 0x00 && current.id == 0x00);
}
startup 
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Kyatto Ninden Teyandee by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("level_split", true, "Split by levels", "options");
	settings.Add("Black_Screen_split", false, "Black Screen split", "options");
}
