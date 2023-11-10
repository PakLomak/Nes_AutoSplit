state("Fceux64", "2.6.6")
{
byte level: "fceux64.exe", 0x04D59E0, 0xB6;
byte reset: "fceux64.exe", 0x04D59E0, 0x21;
}
state("Mesen", "0.9.9")
{
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB6;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x21;
}
state("Mesen", "0.0.6")
{
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xB6;
byte reset: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x21;
}
state("Mesen", "2.0.0")
{
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0xB6;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x21;
}
state("Mednafen", "0.9.48")
{
byte level: "mednafen.exe", 0x136E7B6;
byte reset: "mednafen.exe", 0x136E721;
}
state("Mednafen", "1.29.0")
{
byte level: "mednafen.exe", 0x16675F6;
byte reset: "mednafen.exe", 0x1667561;
}
state("Nestopia", "1.40")
{
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x11E;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x89;
}
state("Nestopia", "1.52")
{
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xB6;
byte reset: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x21;
}
state("Retroarch", "Mesen")
{
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0xB6;
byte reset: "retroarch.exe", 0x0E88F38, 0x408, 0x21;
}

start
{
	if(old.reset == 0x31 && current.reset == 0x79) return true;
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
split
{
	if(old.level == 0x05 && current.level == 0x00 || old.level == 0x04 && current.level == 0x00) return true;
}
reset
{
	return (current.reset ==0x00 && old.reset != 0x00);
}
startup 
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for SD Hero Soukessen-Taose! Aku no Gundan by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
