state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x71;
byte scene: "fceux64.exe", 0x04D59E0, 0x70C;
byte cont: "fceux64.exe", 0x04D59E0, 0x701;
byte boss_hp: "fceux64.exe", 0x04D59E0, 0x39;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x71;
byte scene: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x70C;
byte cont: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x701;
byte boss_hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x39;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x71;
byte scene: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x70C;
byte cont: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x701;
byte boss_hp: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x39;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x71;
byte scene: "MesenCore.dll", 0x440EF98, 0x4A0, 0x70C;
byte cont: "MesenCore.dll", 0x440EF98, 0x4A0, 0x701;
byte boss_hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0x39;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E771;
byte scene: "mednafen.exe", 0x136EE0C;
byte cont: "mednafen.exe", 0x136EE01;
byte boss_hp: "mednafen.exe", 0x136E739;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675B1;
byte scene: "mednafen.exe", 0x1667C4C;
byte cont: "mednafen.exe", 0x1667C41;
byte boss_hp: "mednafen.exe", 0x1667579;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xD9;
byte scene: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x774;
byte cont: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x769;
byte boss_hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA1;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x71;
byte scene: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x70C;
byte cont: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x701;
byte boss_hp: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x39;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x71;
byte scene: "retroarch.exe", 0x0E88F38, 0x408, 0x70C;
byte cont: "retroarch.exe", 0x0E88F38, 0x408, 0x701;
byte boss_hp: "retroarch.exe", 0x0E88F38, 0x408, 0x39;
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
    return (current.start == 0x03 && current.cont == 0x05);
}
split
{
    if (old.scene == 0x08 && current.scene == 0x0A) return true;
    if (old.scene == 0x0C && current.scene == 0x0E) return true;
    if (old.scene == 0x10 && current.scene == 0x11) return true;
    if (old.scene == 0x16 && current.scene == 0x18) return true;
    if (old.scene == 0x1D && current.scene == 0x1E) return true;
    if (current.scene == 0x20 && old.boss_hp != 0x00 && current.boss_hp == 0x00) return true;
}
reset
{
    return (current.start == 0xFF && current.cont == 0xFF);
}
