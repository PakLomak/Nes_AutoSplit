state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x8B;
byte reset: "fceux64.exe", 0x04D59E0, 0x72;
byte time: "fceux64.exe", 0x04D59E0, 0x17;
byte boom: "fceux64.exe", 0x04D59E0, 0x762;
byte oil: "fceux64.exe", 0x04D59E0, 0x2C;
byte end: "fceux64.exe", 0x04D59E0, 0x22;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x8B;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x72;
byte time: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x17;
byte boom: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x762;
byte oil: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2C;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x22;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x8B;
byte reset: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x72;
byte time: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x17;
byte boom: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x762;
byte oil: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x2C;
byte end: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x22;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x8B;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x72;
byte time: "MesenCore.dll", 0x440EF98, 0x4A0, 0x17;
byte boom: "MesenCore.dll", 0x440EF98, 0x4A0, 0x762;
byte oil: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2C;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x22;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E78B;
byte reset: "mednafen.exe", 0x136E772;
byte time: "mednafen.exe", 0x136E717;
byte boom: "mednafen.exe", 0x136EE62;
byte oil: "mednafen.exe", 0x136E72C;
byte end: "mednafen.exe", 0x136E722;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675CB;
byte reset: "mednafen.exe", 0x16675B2;
byte time: "mednafen.exe", 0x1667557;
byte boom: "mednafen.exe", 0x1667CA2;
byte oil: "mednafen.exe", 0x166756C;
byte end: "mednafen.exe", 0x1667562;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xF3;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xDA;
byte time: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7F;
byte boom: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7CA;
byte oil: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x94;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x8A;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x8B;
byte reset: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x72;
byte time: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x17;
byte boom: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x762;
byte oil: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x2C;
byte end: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x22;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x8B;
byte reset: "retroarch.exe", 0x0E88F38, 0x408, 0x72;
byte time: "retroarch.exe", 0x0E88F38, 0x408, 0x17;
byte boom: "retroarch.exe", 0x0E88F38, 0x408, 0x762;
byte oil: "retroarch.exe", 0x0E88F38, 0x408, 0x2C;
byte end: "retroarch.exe", 0x0E88F38, 0x408, 0x22;
}

start
{
    if (current.start == 0x00 && current.reset == 0xFF)
    {
        vars.bam = true;
        vars.STY = true;
        return true;
    }
}
split
{
    if (old.boom == 0x00 && current.boom == 0x03 && current.oil <= 0x0C && vars.bam == true)
    {
        vars.bam = false;
        return true;
    }
    if (old.end == 0x80 && current.end == 0x00 && vars.STY == true)
    {
        vars.STY = false;
        return true;
    }
    if (old.end == 0x82 && current.end == 0x00) return true;
    //if (old.time == 0x00 && current.time == 0x08) return(true);
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
    return (current.start == 0xFF && current.reset == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Formation Z by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
