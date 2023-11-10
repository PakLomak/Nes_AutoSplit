state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x1FC;
byte start2: "fceux64.exe", 0x04D59E0, 0x759;
byte level: "fceux64.exe", 0x04D59E0, 0x35C;
byte boss_hp: "fceux64.exe", 0x04D59E0, 0x554;
byte music: "fceux64.exe", 0x04D59E0, 0xFF;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1FC;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x759;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x35C;
byte boss_hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x554;
byte music: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xFF;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1FC;
byte start2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x759;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x35C;
byte boss_hp: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x554;
byte music: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xFF;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1FC;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x759;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x35C;
byte boss_hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0x554;
byte music: "MesenCore.dll", 0x440EF98, 0x4A0, 0xFF;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E8FC;
byte start2: "mednafen.exe", 0x136EE59;
byte level: "mednafen.exe", 0x136EA5C;
byte boss_hp: "mednafen.exe", 0x136EC54;
byte music: "mednafen.exe", 0x136E7FF;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166773C;
byte start2: "mednafen.exe", 0x1667C99;
byte level: "mednafen.exe", 0x166789C;
byte boss_hp: "mednafen.exe", 0x1667A94;
byte music: "mednafen.exe", 0x166763F;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x264;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7C1;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x3C4;
byte boss_hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x5BC;
byte music: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x167;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x1FC;
byte start2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x759;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x35C;
byte boss_hp: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x554;
byte music: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xFF;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x1FC;
byte start2: "retroarch.exe", 0x0E88F38, 0x408, 0x759;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x35C;
byte boss_hp: "retroarch.exe", 0x0E88F38, 0x408, 0x554;
byte music: "retroarch.exe", 0x0E88F38, 0x408, 0xFF;
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
    return (current.start == 0xCC && current.start2 == 0x0C);
}
split
{
    if (current.level == 0x09 && old.boss_hp == 0x01 && current.boss_hp == 0x00) return true;
    if (settings["Before_Boss"] && current.level >= 0x01 && old.music != 0x37 && current.music == 0x37 && current.boss_hp == 0x18) return true;
    if (old.level == 0x00 && current.level == 0x01) return true;
    if (old.level == 0x01 && current.level == 0x02) return true;
    if (old.level == 0x02 && current.level == 0x03) return true;
    if (old.level == 0x03 && current.level == 0x04) return true;
    if (old.level == 0x04 && current.level == 0x05) return true;
    if (old.level == 0x05 && current.level == 0x06) return true;
    if (old.level == 0x06 && current.level == 0x07) return true;
    if (old.level == 0x07 && current.level == 0x08) return true;
    if (old.level == 0x08 && current.level == 0x09) return true;
}
reset
{
    return (current.start == 0x33 && current.start2 == 0xFF || current.start == 0x33 && current.start2 == 0x0C);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Jungle Book NES by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("Before_Boss", false, "Split before boss", "options");
}
