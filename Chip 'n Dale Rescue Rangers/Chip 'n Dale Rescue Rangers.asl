state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x82;
byte charter: "fceux64.exe", 0x04D59E0, 0x1BA;
byte stage: "fceux64.exe", 0x04D59E0, 0x31;
byte boss_hits: "fceux64.exe", 0x04D59E0, 0xEE;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x82;
byte charter: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1BA;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x31;
byte boss_hits: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xEE;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x82;
byte charter: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1BA;
byte stage: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x31;
byte boss_hits: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xEE;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x82;
byte charter: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1BA;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x31;
byte boss_hits: "MesenCore.dll", 0x440EF98, 0x4A0, 0xEE;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E782;
byte charter: "mednafen.exe", 0x136E8BA;
byte stage: "mednafen.exe", 0x136E731;
byte boss_hits: "mednafen.exe", 0x136E7EE;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675C2;
byte charter: "mednafen.exe", 0x16676FA;
byte stage: "mednafen.exe", 0x1667571;
byte boss_hits: "mednafen.exe", 0x166762E;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xEA;
byte charter: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x222;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x99;
byte boss_hits: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x156;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x82;
byte charter: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x1BA;
byte stage: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x31;
byte boss_hits: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xEE;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x82;
byte charter: "retroarch.exe", 0x0E88F38, 0x408, 0x1BA;
byte stage: "retroarch.exe", 0x0E88F38, 0x408, 0x31;
byte boss_hits: "retroarch.exe", 0x0E88F38, 0x408, 0xEE;
}

start
{
    return (current.start == 0xB3 && current.charter == 0xF3);
}
split
{
    if (current.stage == 0x0D && old.stage != 0x0D) return(true); //Level splits
    if (old.boss_hits == 0x04 && current.boss_hits == 0x05 && current.stage == 0x0A) return(true); //Fat Cat
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
update
{
    //print(modules.First().ModuleMemorySize.ToString());
}
reset
{
	return (current.start == 0xB8 && current.charter == 0x10);
}
startup 
{
    refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Chip'n Dale Rescue Rangers by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/PakLomak", "main");
}
