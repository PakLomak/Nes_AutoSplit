state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x1E7;
byte start2: "fceux64.exe", 0x04D59E0, 0x1F0;
byte start3: "fceux64.exe", 0x04D59E0, 0x1F2;
byte magic: "fceux64.exe", 0x04D59E0, 0x4C4;
byte level2: "fceux64.exe", 0x04D59E0, 0x2;
byte level3: "fceux64.exe", 0x04D59E0, 0x3;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1E7;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1F0;
byte start3: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1F2;
byte magic: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4C4;
byte level2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2;
byte level3: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1E7;
byte start2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1F0;
byte start3: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1F2;
byte magic: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x4C4;
byte level2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x2;
byte level3: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1E7;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1F0;
byte start3: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1F2;
byte magic: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4C4;
byte level2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2;
byte level3: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E8E7;
byte start2: "mednafen.exe", 0x136E8F0;
byte start3: "mednafen.exe", 0x136E8F2;
byte magic: "mednafen.exe", 0x136EBC4;
byte level2: "mednafen.exe", 0x136E702;
byte level3: "mednafen.exe", 0x136E703;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667727;
byte start2: "mednafen.exe", 0x1667730;
byte start3: "mednafen.exe", 0x1667732;
byte magic: "mednafen.exe", 0x1667A04;
byte level2: "mednafen.exe", 0x1667542;
byte level3: "mednafen.exe", 0x1667543;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x24F;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x258;
byte start3: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x25A;
byte magic: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x52C;
byte level2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6A;
byte level3: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x1E7;
byte start2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x1F0;
byte start3: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x1F2;
byte magic: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x4C4;
byte level2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x2;
byte level3: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x1E7;
byte start2: "retroarch.exe", 0x0E88F38, 0x408, 0x1F0;
byte start3: "retroarch.exe", 0x0E88F38, 0x408, 0x1F2;
byte magic: "retroarch.exe", 0x0E88F38, 0x408, 0x4C4;
byte level2: "retroarch.exe", 0x0E88F38, 0x408, 0x2;
byte level3: "retroarch.exe", 0x0E88F38, 0x408, 0x3;
}

start
{
    if (current.level3 == 0x01 && current.start == 0x05 && current.start2 == 0x02 && current.start3 == 0x10) return(true);
}
split
{
    if (current.level2 == 0x25 && old.level2 != 0x25 && current.level3 == 0x02 && current.magic == 0x01) return(true);
    if (old.level2 == 0xD3 && current.level2 == 0xC2 && current.level3 == 0xFA) return(true);
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
    return (current.level2 == 0x5A && current.level3 == 0xAA);
}
startup
{
    refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Tom & Jerry and Tuffy by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
