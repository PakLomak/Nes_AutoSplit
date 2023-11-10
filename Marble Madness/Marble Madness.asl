state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x48;
byte start2: "fceux64.exe", 0x04D59E0, 0x1D;
byte end: "fceux64.exe", 0x04D59E0, 0x8B;
byte stage: "fceux64.exe", 0x04D59E0, 0x34;
byte reset: "fceux64.exe", 0x04D59E0, 0x3;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x48;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1D;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x8B;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x34;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x48;
byte start2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1D;
byte end: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x8B;
byte stage: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x34;
byte reset: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x48;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1D;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x8B;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x34;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E748;
byte start2: "mednafen.exe", 0x136E71D;
byte end: "mednafen.exe", 0x136E78B;
byte stage: "mednafen.exe", 0x136E734;
byte reset: "mednafen.exe", 0x136E703;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667588;
byte start2: "mednafen.exe", 0x166755D;
byte end: "mednafen.exe", 0x16675CB;
byte stage: "mednafen.exe", 0x1667574;
byte reset: "mednafen.exe", 0x1667543;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB0;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x85;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xF3;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x9C;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x48;
byte start2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x1D;
byte end: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x8B;
byte stage: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x34;
byte reset: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x48;
byte start2: "retroarch.exe", 0x0E88F38, 0x408, 0x1D;
byte end: "retroarch.exe", 0x0E88F38, 0x408, 0x8B;
byte stage: "retroarch.exe", 0x0E88F38, 0x408, 0x34;
byte reset: "retroarch.exe", 0x0E88F38, 0x408, 0x3;
}

start
{
    return (current.start == 0xFF && current.start2 == 0x3B);
}
split
{
    if (settings["Flag_split"] && old.end == 0x01 && current.end == 0x00) return(true); //Flag splits
    if (old.end != 0x00 && current.end == 0x00 && current.stage == 0x05) return(true); //End split
    return (settings["level_split"] && current.stage > old.stage); //Level splits
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
	return (current.reset == 0x04);
}
startup 
{
    refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Marble Madness by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/PakLomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("level_split", true, "Split by levels", "options");
    settings.Add("Flag_split", false, "Split by Flag", "options");
}
