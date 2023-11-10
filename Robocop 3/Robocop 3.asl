state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x0;
byte input: "fceux64.exe", 0x04D59E0, 0x2;
byte stage: "fceux64.exe", 0x04D59E0, 0x3;
byte boss: "fceux64.exe", 0x04D59E0, 0x3C6;
byte boss2: "fceux64.exe", 0x04D59E0, 0x29;
byte message: "fceux64.exe", 0x04D59E0, 0x46;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x0;
byte input: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3;
byte boss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3C6;
byte boss2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x29;
byte message: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x46;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x0;
byte input: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x2;
byte stage: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3;
byte boss: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3C6;
byte boss2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x29;
byte message: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x46;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x0;
byte input: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3;
byte boss: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3C6;
byte boss2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x29;
byte message: "MesenCore.dll", 0x440EF98, 0x4A0, 0x46;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E700;
byte input: "mednafen.exe", 0x136E702;
byte stage: "mednafen.exe", 0x136E703;
byte boss: "mednafen.exe", 0x136EAC6;
byte boss2: "mednafen.exe", 0x136E729;
byte message: "mednafen.exe", 0x136E746;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667540;
byte input: "mednafen.exe", 0x1667542;
byte stage: "mednafen.exe", 0x1667543;
byte boss: "mednafen.exe", 0x1667906;
byte boss2: "mednafen.exe", 0x1667569;
byte message: "mednafen.exe", 0x1667586;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x68;
byte input: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6A;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B;
byte boss: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x42E;
byte boss2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x91;
byte message: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xAE;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x0;
byte input: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x2;
byte stage: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3;
byte boss: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3C6;
byte boss2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x29;
byte message: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x46;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x0;
byte input: "retroarch.exe", 0x0E88F38, 0x408, 0x2;
byte stage: "retroarch.exe", 0x0E88F38, 0x408, 0x3;
byte boss: "retroarch.exe", 0x0E88F38, 0x408, 0x3C6;
byte boss2: "retroarch.exe", 0x0E88F38, 0x408, 0x29;
byte message: "retroarch.exe", 0x0E88F38, 0x408, 0x46;
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
    return (current.start == 1 && current.input == 1 && current.stage == 0);
}
split
{
    if (current.boss2 == 8 && old.boss != 0 && current.boss == 0 && current.stage == 1) return true;
    if (current.stage == 4 && old.message != 0x0C && current.message == 0x0C) return true;
    return (current.stage > old.stage && current.stage != 2);
}
reset
{
    return (current.start == 0 && current.boss2 == 0 && current.boss == 0);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Robocop 3 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
