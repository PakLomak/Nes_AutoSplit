state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x1FC;
byte level: "fceux64.exe", 0x04D59E0, 0x718;
byte life: "fceux64.exe", 0x04D59E0, 0x71A;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1FC;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x718;
byte life: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x71A;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1FC;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x718;
byte life: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x71A;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1FC;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x718;
byte life: "MesenCore.dll", 0x440EF98, 0x4A0, 0x71A;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E8FC;
byte level: "mednafen.exe", 0x136EE18;
byte life: "mednafen.exe", 0x136EE1A;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166773C;
byte level: "mednafen.exe", 0x1667C58;
byte life: "mednafen.exe", 0x1667C5A;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x264;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x780;
byte life: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x782;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x1FC;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x718;
byte life: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x71A;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x1FC;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x718;
byte life: "retroarch.exe", 0x0E88F38, 0x408, 0x71A;
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
    return (current.level == 0x01 && old.life == 0x00 && current.life >= 0x01 && current.start == 0x94);
}
split
{
    if (current.level <= 0x04 && old.start != 0x8C && current.start == 0x8C) return true;
    if (current.level == 0x05 && old.start != 0x2E && current.start == 0x2E) return true;
    if (current.level == 0x05 && old.start != 0x16 && current.start == 0x16) return true;
}
reset
{
    return (current.start == 0x4E);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Terminator 2 - Judgment Day by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
