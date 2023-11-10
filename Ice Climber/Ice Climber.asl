state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0xF3;
byte start2: "fceux64.exe", 0x04D59E0, 0xD4;
byte screen: "fceux64.exe", 0x04D59E0, 0x55;
byte lives: "fceux64.exe", 0x04D59E0, 0x20;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xF3;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xD4;
byte screen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x55;
byte lives: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x20;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xF3;
byte start2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xD4;
byte screen: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x55;
byte lives: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x20;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0xF3;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0xD4;
byte screen: "MesenCore.dll", 0x440EF98, 0x4A0, 0x55;
byte lives: "MesenCore.dll", 0x440EF98, 0x4A0, 0x20;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E7F3;
byte start2: "mednafen.exe", 0x136E7D4;
byte screen: "mednafen.exe", 0x136E755;
byte lives: "mednafen.exe", 0x136E720;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667633;
byte start2: "mednafen.exe", 0x1667614;
byte screen: "mednafen.exe", 0x1667595;
byte lives: "mednafen.exe", 0x1667560;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x15B;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x13C;
byte screen: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xBD;
byte lives: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x88;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xF3;
byte start2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xD4;
byte screen: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x55;
byte lives: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x20;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0xF3;
byte start2: "retroarch.exe", 0x0E88F38, 0x408, 0xD4;
byte screen: "retroarch.exe", 0x0E88F38, 0x408, 0x55;
byte lives: "retroarch.exe", 0x0E88F38, 0x408, 0x20;
}

start
{
    return (current.start == 0x02 && current.start2 == 0x07 || current.start == 0x02 && current.start2 == 0x08);
}
split
{
    if (current.lives != 0x80 && current.start2 == 0x00 && old.screen != 0x04 && current.screen == 0x04) return(true);
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
reset
{
    return (current.start == 0x04 && current.start2 == 0x00 && current.screen == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Ice Climber by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
