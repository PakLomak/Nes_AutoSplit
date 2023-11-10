state("Fceux64", "2.6.6")
{
byte play: "fceux64.exe", 0x04D59E0, 0x770;
byte world: "fceux64.exe", 0x04D59E0, 0x75F;
byte lvl: "fceux64.exe", 0x04D59E0, 0x760;
byte time: "fceux64.exe", 0x04D59E0, 0x7F8;
byte time1: "fceux64.exe", 0x04D59E0, 0x7FA;
}
state("Mesen", "0.9.9")
{
byte play: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x770;
byte world: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x75F;
byte lvl: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x760;
byte time: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x7F8;
byte time1: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x7FA;
}
state("Mesen", "0.0.6")
{
byte play: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x770;
byte world: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x75F;
byte lvl: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x760;
byte time: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x7F8;
byte time1: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x7FA;
}
state("Mesen", "2.0.0")
{
byte play: "MesenCore.dll", 0x440EF98, 0x4A0, 0x770;
byte world: "MesenCore.dll", 0x440EF98, 0x4A0, 0x75F;
byte lvl: "MesenCore.dll", 0x440EF98, 0x4A0, 0x760;
byte time: "MesenCore.dll", 0x440EF98, 0x4A0, 0x7F8;
byte time1: "MesenCore.dll", 0x440EF98, 0x4A0, 0x7FA;
}
state("Mednafen", "0.9.48")
{
byte play: "mednafen.exe", 0x136EE70;
byte world: "mednafen.exe", 0x136EE5F;
byte lvl: "mednafen.exe", 0x136EE60;
byte time: "mednafen.exe", 0x136EEF8;
byte time1: "mednafen.exe", 0x136EEFA;
}
state("Mednafen", "1.29.0")
{
byte play: "mednafen.exe", 0x1667CB0;
byte world: "mednafen.exe", 0x1667C9F;
byte lvl: "mednafen.exe", 0x1667CA0;
byte time: "mednafen.exe", 0x1667D38;
byte time1: "mednafen.exe", 0x1667D3A;
}
state("Nestopia", "1.40")
{
byte play: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7D8;
byte world: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7C7;
byte lvl: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7C8;
byte time: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x860;
byte time1: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x862;
}
state("Nestopia", "1.52")
{
byte play: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x770;
byte world: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x75F;
byte lvl: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x760;
byte time: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x7F8;
byte time1: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x7FA;
}
state("Retroarch", "Mesen")
{
byte play: "retroarch.exe", 0x0E88F38, 0x408, 0x770;
byte world: "retroarch.exe", 0x0E88F38, 0x408, 0x75F;
byte lvl: "retroarch.exe", 0x0E88F38, 0x408, 0x760;
byte time: "retroarch.exe", 0x0E88F38, 0x408, 0x7F8;
byte time1: "retroarch.exe", 0x0E88F38, 0x408, 0x7FA;
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
    return (current.play == 0x01 && current.time == 0x04 && old.time1 == 0x01 && current.time1 == 0x00);
}
split
{
    if (current.world == old.world + 1) return true;
    if (old.lvl == 0x00 && current.lvl == 0x01) return true;
    if (current.world == 0x02 && old.lvl == 0x01 && current.lvl == 0x02) return true;
    if (current.world == 0x04 && old.lvl == 0x01 && current.lvl == 0x02) return true;
    if (current.world == 0x05 && old.lvl == 0x01 && current.lvl == 0x02) return true;
    if (current.world == 0x07 && old.lvl == 0x01 && current.lvl == 0x02) return true;
    if (old.lvl == 0x02 && current.lvl == 0x03) return true;
    if (old.lvl == 0x03 && current.lvl == 0x04) return true;
    if (current.world == 0x07 && current.lvl == 0x03 && old.play == 0x01 && current.play == 0x02) return true;
}
reset
{
    return (current.play == 0x00 && current.lvl == 0x00 && current.world == 0x00);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Super Mario Bros by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
