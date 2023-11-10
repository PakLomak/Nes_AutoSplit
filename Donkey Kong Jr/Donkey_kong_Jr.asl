state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x14;
byte start2: "fceux64.exe", 0x04D59E0, 0x4C;
byte reset: "fceux64.exe", 0x04D59E0, 0x4A;
byte z: "fceux64.exe", 0x04D59E0, 0xFC;
byte x: "fceux64.exe", 0x04D59E0, 0x4D;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x14;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4C;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4A;
byte z: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xFC;
byte x: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4D;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x14;
byte start2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x4C;
byte reset: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x4A;
byte z: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xFC;
byte x: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x4D;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x14;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4C;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4A;
byte z: "MesenCore.dll", 0x440EF98, 0x4A0, 0xFC;
byte x: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4D;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E714;
byte start2: "mednafen.exe", 0x136E74C;
byte reset: "mednafen.exe", 0x136E74A;
byte z: "mednafen.exe", 0x136E7FC;
byte x: "mednafen.exe", 0x136E74D;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667554;
byte start2: "mednafen.exe", 0x166758C;
byte reset: "mednafen.exe", 0x166758A;
byte z: "mednafen.exe", 0x166763C;
byte x: "mednafen.exe", 0x166758D;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7C;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB4;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB2;
byte z: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x164;
byte x: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB5;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x14;
byte start2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x4C;
byte reset: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x4A;
byte z: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xFC;
byte x: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x4D;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x14;
byte start2: "retroarch.exe", 0x0E88F38, 0x408, 0x4C;
byte reset: "retroarch.exe", 0x0E88F38, 0x408, 0x4A;
byte z: "retroarch.exe", 0x0E88F38, 0x408, 0xFC;
byte x: "retroarch.exe", 0x0E88F38, 0x408, 0x4D;
}

start
{
    return (current.start == 0x10 && current.start2 == 0x03 && current.reset == 0x01);
}
split
{
    if (old.x == 0x01 && current.x == 0x00) return(true);
    if (current.x == 0x06 && old.z == 0x10 && current.z == 0x00) return(true);
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
    return (current.start2 == 0x01 && current.reset == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Donkey Kong Jr by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
