state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x0;
byte demo: "fceux64.exe", 0x04D59E0, 0x59C;
byte level: "fceux64.exe", 0x04D59E0, 0x59;
byte Hp1: "fceux64.exe", 0x04D59E0, 0xA1;
byte Hp2: "fceux64.exe", 0x04D59E0, 0xA2;
byte reset: "fceux64.exe", 0x04D59E0, 0x58;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x0;
byte demo: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x59C;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x59;
byte Hp1: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xA1;
byte Hp2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xA2;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x58;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x0;
byte demo: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x59C;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x59;
byte Hp1: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xA1;
byte Hp2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xA2;
byte reset: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x58;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x0;
byte demo: "MesenCore.dll", 0x440EF98, 0x4A0, 0x59C;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x59;
byte Hp1: "MesenCore.dll", 0x440EF98, 0x4A0, 0xA1;
byte Hp2: "MesenCore.dll", 0x440EF98, 0x4A0, 0xA2;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x58;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E700;
byte demo: "mednafen.exe", 0x136EC9C;
byte level: "mednafen.exe", 0x136E759;
byte Hp1: "mednafen.exe", 0x136E7A1;
byte Hp2: "mednafen.exe", 0x136E7A2;
byte reset: "mednafen.exe", 0x136E758;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667540;
byte demo: "mednafen.exe", 0x1667ADC;
byte level: "mednafen.exe", 0x1667599;
byte Hp1: "mednafen.exe", 0x16675E1;
byte Hp2: "mednafen.exe", 0x16675E2;
byte reset: "mednafen.exe", 0x1667598;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x68;
byte demo: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x604;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xC1;
byte Hp1: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x109;
byte Hp2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x10A;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xC0;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x0;
byte demo: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x59C;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x59;
byte Hp1: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xA1;
byte Hp2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xA2;
byte reset: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x58;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x0;
byte demo: "retroarch.exe", 0x0E88F38, 0x408, 0x59C;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x59;
byte Hp1: "retroarch.exe", 0x0E88F38, 0x408, 0xA1;
byte Hp2: "retroarch.exe", 0x0E88F38, 0x408, 0xA2;
byte reset: "retroarch.exe", 0x0E88F38, 0x408, 0x58;
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
    return (old.start == 0x03 && current.start == 0x01 && current.demo == 0x00);
}
split
{
    if (current.level == old.level + 1) return true;
    if (current.level == 0x0D && current.Hp1 == 0x00 && old.Hp2 == 0x01 && current.Hp2 == 0x00) return true;
}
reset
{
    return (current.reset == 0x00 && current.start == 0x00 && current.level == 0x00 && current.Hp1 == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Robocop 2 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
