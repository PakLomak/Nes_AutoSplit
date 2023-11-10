state("Fceux64", "2.6.6")
{
byte level: "fceux64.exe", 0x04D59E0, 0x30;
byte gmode: "fceux64.exe", 0x04D59E0, 0x2C;
byte tas: "fceux64.exe", 0x04D59E0, 0x2D;
byte scroll: "fceux64.exe", 0x04D59E0, 0x6;
byte start: "fceux64.exe", 0x04D59E0, 0x18;
}
state("Mesen", "0.9.9")
{
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x30;
byte gmode: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2C;
byte tas: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2D;
byte scroll: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x6;
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x18;
}
state("Mesen", "0.0.6")
{
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x30;
byte gmode: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x2C;
byte tas: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x2D;
byte scroll: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x6;
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x18;
}
state("Mesen", "2.0.0")
{
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x30;
byte gmode: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2C;
byte tas: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2D;
byte scroll: "MesenCore.dll", 0x440EF98, 0x4A0, 0x6;
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x18;
}
state("Mednafen", "0.9.48")
{
byte level: "mednafen.exe", 0x136E730;
byte gmode: "mednafen.exe", 0x136E72C;
byte tas: "mednafen.exe", 0x136E72D;
byte scroll: "mednafen.exe", 0x136E706;
byte start: "mednafen.exe", 0x136E718;
}
state("Mednafen", "1.29.0")
{
byte level: "mednafen.exe", 0x1667570;
byte gmode: "mednafen.exe", 0x166756C;
byte tas: "mednafen.exe", 0x166756D;
byte scroll: "mednafen.exe", 0x1667546;
byte start: "mednafen.exe", 0x1667558;
}
state("Nestopia", "1.40")
{
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x98;
byte gmode: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x94;
byte tas: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x95;
byte scroll: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6E;
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x80;
}
state("Nestopia", "1.52")
{
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x30;
byte gmode: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x2C;
byte tas: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x2D;
byte scroll: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x6;
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x18;
}
state("Retroarch", "Mesen")
{
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x30;
byte gmode: "retroarch.exe", 0x0E88F38, 0x408, 0x2C;
byte tas: "retroarch.exe", 0x0E88F38, 0x408, 0x2D;
byte scroll: "retroarch.exe", 0x0E88F38, 0x408, 0x6;
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x18;
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
    return (current.level == 0x00 && current.start == 0x05 && old.gmode == 0x03 && current.gmode == 0x04);
}
reset
{
    return (current.gmode == 0x00 && current.scroll == 0x48 && current.level == 0x00 && current.start == 0x00);
}
split
{
    if (settings["wtcd"] && old.tas == 0x01 && current.tas == 0x02 && current.level != 0x07) return true;
    if (current.level == 0x07 && old.tas != 0x01 && current.tas == 0x01) return true;
    if(settings["Level"])
    {
        if (old.level == 0x00 && current.level == 0x01) return true;
        if (old.level == 0x01 && current.level == 0x02) return true;
        if (old.level == 0x02 && current.level == 0x03) return true;
        if (old.level == 0x03 && current.level == 0x04) return true;
        if (old.level == 0x04 && current.level == 0x05) return true;
        if (old.level == 0x05 && current.level == 0x06) return true;
        if (old.level == 0x06 && current.level == 0x07) return true;
    }
}
startup
{
	settings.Add("main", false, "AutoSplitter for Contra by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("Level", true, "Split by Level", "options");
    settings.Add("wtcd", false, "Split when the character disappeared", "options");
}
