state("Fceux64", "2.6.6")
{
byte screen: "fceux64.exe", 0x04D59E0, 0x18;
byte win: "fceux64.exe", 0x04D59E0, 0x19;
}
state("Mesen", "0.9.9")
{
byte screen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x18;
byte win: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x19;
}
state("Mesen", "0.0.6")
{
byte screen: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x18;
byte win: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x19;
}
state("Mesen", "2.0.0")
{
byte screen: "MesenCore.dll", 0x440EF98, 0x4A0, 0x18;
byte win: "MesenCore.dll", 0x440EF98, 0x4A0, 0x19;
}
state("Mednafen", "0.9.48")
{
byte screen: "mednafen.exe", 0x136E718;
byte win: "mednafen.exe", 0x136E719;
}
state("Mednafen", "1.29.0")
{
byte screen: "mednafen.exe", 0x1667558;
byte win: "mednafen.exe", 0x1667559;
}
state("Nestopia", "1.40")
{
byte screen: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x80;
byte win: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x81;
}
state("Nestopia", "1.52")
{
byte screen: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x18;
byte win: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x19;
}
state("Retroarch", "Mesen")
{
byte screen: "retroarch.exe", 0x0E88F38, 0x408, 0x18;
byte win: "retroarch.exe", 0x0E88F38, 0x408, 0x19;
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
start
{
    return (current.screen == 0x03 && current.win == 0x02);
}
split
{
    if (current.screen == 0x08 && current.win == 0x0B && old.win != 0x0B) return true;
    if (current.screen == 0x07 && current.win == 0x02 && old.win != 0x02) return true;
}
startup
{
	settings.Add("main", false, "AutoSplitter for Power Blade by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
