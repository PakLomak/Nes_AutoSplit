state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x28;
byte boss: "fceux64.exe", 0x04D59E0, 0x42C;
byte music: "fceux64.exe", 0x04D59E0, 0xED;
byte level: "fceux64.exe", 0x04D59E0, 0x33;
byte reset: "fceux64.exe", 0x04D59E0, 0x3A9;
byte ingame: "fceux64.exe", 0x04D59E0, 0x616;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x28;
byte boss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x42C;
byte music: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xED;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x33;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3A9;
byte ingame: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x616;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x28;
byte boss: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x42C;
byte music: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xED;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x33;
byte reset: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3A9;
byte ingame: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x616;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x28;
byte boss: "MesenCore.dll", 0x440EF98, 0x4A0, 0x42C;
byte music: "MesenCore.dll", 0x440EF98, 0x4A0, 0xED;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x33;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3A9;
byte ingame: "MesenCore.dll", 0x440EF98, 0x4A0, 0x616;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E728;
byte boss: "mednafen.exe", 0x136EB2C;
byte music: "mednafen.exe", 0x136E7ED;
byte level: "mednafen.exe", 0x136E733;
byte reset: "mednafen.exe", 0x136EAA9;
byte ingame: "mednafen.exe", 0x136ED16;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667568;
byte boss: "mednafen.exe", 0x166796C;
byte music: "mednafen.exe", 0x166762D;
byte level: "mednafen.exe", 0x1667573;
byte reset: "mednafen.exe", 0x16678E9;
byte ingame: "mednafen.exe", 0x1667B56;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x90;
byte boss: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x494;
byte music: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x155;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x9B;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x411;
byte ingame: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x67E;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x28;
byte boss: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x42C;
byte music: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xED;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x33;
byte reset: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3A9;
byte ingame: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x616;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x28;
byte boss: "retroarch.exe", 0x0E88F38, 0x408, 0x42C;
byte music: "retroarch.exe", 0x0E88F38, 0x408, 0xED;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x33;
byte reset: "retroarch.exe", 0x0E88F38, 0x408, 0x3A9;
byte ingame: "retroarch.exe", 0x0E88F38, 0x408, 0x616;
}

update
{
    //print(modules.First().ModuleMemorySize.ToString());
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
	if (old.start ==0x01 && current.start ==0x06) return true;
}
split
{
	if (current.boss == 0x00 && old.boss != 0x00 && current.music == 0xBF) return true;
	if (current.ingame == 0x01 && current.level == old.level + 1) return true;
}
reset
{
	return (current.reset == 0x00 && old.reset != 0x00);
}
startup 
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Felix the Cat by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
