state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x4;
byte imput: "fceux64.exe", 0x04D59E0, 0x32;
byte lvl: "fceux64.exe", 0x04D59E0, 0x41;
byte scene: "fceux64.exe", 0x04D59E0, 0x3;
byte end: "fceux64.exe", 0x04D59E0, 0x531;
byte end2: "fceux64.exe", 0x04D59E0, 0x530;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4;
byte imput: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x32;
byte lvl: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x41;
byte scene: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x531;
byte end2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x530;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x4;
byte imput: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x32;
byte lvl: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x41;
byte scene: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3;
byte end: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x531;
byte end2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x530;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4;
byte imput: "MesenCore.dll", 0x440EF98, 0x4A0, 0x32;
byte lvl: "MesenCore.dll", 0x440EF98, 0x4A0, 0x41;
byte scene: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x531;
byte end2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x530;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E704;
byte imput: "mednafen.exe", 0x136E732;
byte lvl: "mednafen.exe", 0x136E741;
byte scene: "mednafen.exe", 0x136E703;
byte end: "mednafen.exe", 0x136EC31;
byte end2: "mednafen.exe", 0x136EC30;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667544;
byte imput: "mednafen.exe", 0x1667572;
byte lvl: "mednafen.exe", 0x1667581;
byte scene: "mednafen.exe", 0x1667543;
byte end: "mednafen.exe", 0x1667A71;
byte end2: "mednafen.exe", 0x1667A70;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6C;
byte imput: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x9A;
byte lvl: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA9;
byte scene: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x599;
byte end2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x598;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x4;
byte imput: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x32;
byte lvl: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x41;
byte scene: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3;
byte end: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x531;
byte end2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x530;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x4;
byte imput: "retroarch.exe", 0x0E88F38, 0x408, 0x32;
byte lvl: "retroarch.exe", 0x0E88F38, 0x408, 0x41;
byte scene: "retroarch.exe", 0x0E88F38, 0x408, 0x3;
byte end: "retroarch.exe", 0x0E88F38, 0x408, 0x531;
byte end2: "retroarch.exe", 0x0E88F38, 0x408, 0x530;
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
    return (current.start == 0x07 && current.scene == 0x01);
}
split
{
    if (old.lvl == 0x03 && current.lvl == 0x04) return true; //boss 1
    if (old.lvl == 0x08 && current.lvl == 0x09) return true; //boss 2
    if (old.lvl == 0x10 && current.lvl == 0x11) return true; //boss 3
    if (old.lvl == 0x15 && current.lvl == 0x1C) return true; //boss 4
    if (old.lvl == 0x25 && current.lvl == 0x26) return true; //1st guardian
    if (old.lvl == 0x2C && current.lvl == 0x2D) return true; //2d guardian
    if (old.lvl == 0x34 && current.lvl == 0x35) return true; //3d guardian
    if (current.lvl == 0x37 && old.end == 0x1F && current.end == 0x20) return true;
    if (current.lvl == 0x38 && old.end2 == 0x1F && current.end2 == 0x20) return true;
}
reset
{
    return (current.start == 0x00 && current.scene == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Mitsume ga Tooru by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
