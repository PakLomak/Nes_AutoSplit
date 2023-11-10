state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x31B;
byte level: "fceux64.exe", 0x04D59E0, 0x300;
byte gate: "fceux64.exe", 0x04D59E0, 0x6F5;
byte hp: "fceux64.exe", 0x04D59E0, 0x6DA;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x31B;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x300;
byte gate: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x6F5;
byte hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x6DA;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x31B;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x300;
byte gate: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x6F5;
byte hp: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x6DA;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x31B;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x300;
byte gate: "MesenCore.dll", 0x440EF98, 0x4A0, 0x6F5;
byte hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0x6DA;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136EA1B;
byte level: "mednafen.exe", 0x136EA00;
byte gate: "mednafen.exe", 0x136EDF5;
byte hp: "mednafen.exe", 0x136EDDA;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166785B;
byte level: "mednafen.exe", 0x1667840;
byte gate: "mednafen.exe", 0x1667C35;
byte hp: "mednafen.exe", 0x1667C1A;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x383;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x368;
byte gate: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x75D;
byte hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x742;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x31B;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x300;
byte gate: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x6F5;
byte hp: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x6DA;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x31B;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x300;
byte gate: "retroarch.exe", 0x0E88F38, 0x408, 0x6F5;
byte hp: "retroarch.exe", 0x0E88F38, 0x408, 0x6DA;
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
    return (old.start == 0x1C && current.start == 0x3C && current.level == 0x00);
}
split
{
    if (current.level == old.level + 1) return true;
    if (current.level == 0x07 && old.gate == 0x00 && current.gate == 0x02) return true;
    if (current.level == 0x0F && old.gate == 0x00 && current.gate == 0x01) return true;
    if (current.level == 0x17 && old.gate == 0x00 && current.gate == 0x02) return true;
    if (current.level == 0x1E && old.gate == 0x00 && current.gate == 0x04) return true;
    if (old.level == 0x1E && current.level == 0x63 && current.hp == 0x80) return true;
}
reset
{
    return (current.gate == 0x05 && current.level == 0x63);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Rod Land by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
