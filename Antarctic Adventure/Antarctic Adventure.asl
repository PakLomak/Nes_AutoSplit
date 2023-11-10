state("Fceux64", "2.6.6")
{
byte zero: "fceux64.exe", 0x04D59E0, 0x0;
byte start: "fceux64.exe", 0x04D59E0, 0x22;
byte lvl: "fceux64.exe", 0x04D59E0, 0x61;
byte km1: "fceux64.exe", 0x04D59E0, 0xD6;
byte finish: "fceux64.exe", 0x04D59E0, 0x66;
}
state("Mesen", "0.9.9")
{
byte zero: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x0;
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x22;
byte lvl: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x61;
byte km1: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xD6;
byte finish: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x66;
}
state("Mesen", "0.0.6")
{
byte zero: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x0;
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x22;
byte lvl: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x61;
byte km1: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xD6;
byte finish: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x66;
}
state("Mesen", "2.0.0")
{
byte zero: "MesenCore.dll", 0x440EF98, 0x4A0, 0x0;
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x22;
byte lvl: "MesenCore.dll", 0x440EF98, 0x4A0, 0x61;
byte km1: "MesenCore.dll", 0x440EF98, 0x4A0, 0xD6;
byte finish: "MesenCore.dll", 0x440EF98, 0x4A0, 0x66;
}
state("Mednafen", "0.9.48")
{
byte zero: "mednafen.exe", 0x136E700;
byte start: "mednafen.exe", 0x136E722;
byte lvl: "mednafen.exe", 0x136E761;
byte km1: "mednafen.exe", 0x136E7D6;
byte finish: "mednafen.exe", 0x136E766;
}
state("Mednafen", "1.29.0")
{
byte zero: "mednafen.exe", 0x1667540;
byte start: "mednafen.exe", 0x1667562;
byte lvl: "mednafen.exe", 0x16675A1;
byte km1: "mednafen.exe", 0x1667616;
byte finish: "mednafen.exe", 0x16675A6;
}
state("Nestopia", "1.40")
{
byte zero: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x68;
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x8A;
byte lvl: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xC9;
byte km1: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x13E;
byte finish: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xCE;
}
state("Nestopia", "1.52")
{
byte zero: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x0;
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x22;
byte lvl: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x61;
byte km1: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xD6;
byte finish: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x66;
}
state("Retroarch", "Mesen")
{
byte zero: "retroarch.exe", 0x0E88F38, 0x408, 0x0;
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x22;
byte lvl: "retroarch.exe", 0x0E88F38, 0x408, 0x61;
byte km1: "retroarch.exe", 0x0E88F38, 0x408, 0xD6;
byte finish: "retroarch.exe", 0x0E88F38, 0x408, 0x66;
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
    return (current.zero == 0x01 && old.start == 0x00 && current.start == 0x01);
}
split
{
    if (settings["KM"] && old.zero == 0x05 && current.zero == 0x08 && current.km1 == 0x09) return true;
    if (settings["Level"] && current.lvl == old.lvl + 1) return true;
    if (settings["Finish"] && current.zero == 0x08 && old.finish == 0x00 && current.finish == 0x01) return true;
}
reset
{
    return (current.lvl == 0x01 && current.zero == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Antarctic Adventure by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("KM", false, "Split by KM", "options");
    settings.Add("Level", false, "Split by levels", "options");
    settings.Add("Finish", true, "Split by Finish", "options");
}
