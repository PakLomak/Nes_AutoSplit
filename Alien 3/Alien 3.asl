state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x1FB;
byte screen: "fceux64.exe", 0x04D59E0, 0x39;
byte stage: "fceux64.exe", 0x04D59E0, 0xA8;
byte menu: "fceux64.exe", 0x04D59E0, 0x7A7;
byte x: "fceux64.exe", 0x04D59E0, 0x41;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1FB;
byte screen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x39;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xA8;
byte menu: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x7A7;
byte x: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x41;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1FB;
byte screen: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x39;
byte stage: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xA8;
byte menu: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x7A7;
byte x: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x41;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1FB;
byte screen: "MesenCore.dll", 0x440EF98, 0x4A0, 0x39;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0xA8;
byte menu: "MesenCore.dll", 0x440EF98, 0x4A0, 0x7A7;
byte x: "MesenCore.dll", 0x440EF98, 0x4A0, 0x41;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E8FB;
byte screen: "mednafen.exe", 0x136E739;
byte stage: "mednafen.exe", 0x136E7A8;
byte menu: "mednafen.exe", 0x136EEA7;
byte x: "mednafen.exe", 0x136E741;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166773B;
byte screen: "mednafen.exe", 0x1667579;
byte stage: "mednafen.exe", 0x16675E8;
byte menu: "mednafen.exe", 0x1667CE7;
byte x: "mednafen.exe", 0x1667581;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x263;
byte screen: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA1;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x110;
byte menu: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x80F;
byte x: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA9;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x1FB;
byte screen: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x39;
byte stage: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xA8;
byte menu: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x7A7;
byte x: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x41;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x1FB;
byte screen: "retroarch.exe", 0x0E88F38, 0x408, 0x39;
byte stage: "retroarch.exe", 0x0E88F38, 0x408, 0xA8;
byte menu: "retroarch.exe", 0x0E88F38, 0x408, 0x7A7;
byte x: "retroarch.exe", 0x0E88F38, 0x408, 0x41;
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
	return (current.screen == 0x9f && current.menu == 0x00 && current.x == 0x9D && current.start == 0xA4);
}
split
{
	if (current.stage == 0x0B && old.screen != 0xA7 && current.screen == 0xA7) return(true);
	if (settings["level_split"] && current.stage == old.stage + 1) return true;
}
reset
{
	return (current.screen == 0xA2);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Alien 3 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("level_split", true, "Split by levels", "options");
}
