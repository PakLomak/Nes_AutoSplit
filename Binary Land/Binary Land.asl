state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x10;
byte start2: "fceux64.exe", 0x04D59E0, 0x2F;
byte stage: "fceux64.exe", 0x04D59E0, 0x1D;
byte cage: "fceux64.exe", 0x04D59E0, 0x20;
byte reset: "fceux64.exe", 0x04D59E0, 0x1FC;
byte time: "fceux64.exe", 0x04D59E0, 0x55;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x10;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2F;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1D;
byte cage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x20;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1FC;
byte time: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x55;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x10;
byte start2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x2F;
byte stage: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1D;
byte cage: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x20;
byte reset: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1FC;
byte time: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x55;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x10;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2F;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1D;
byte cage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x20;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1FC;
byte time: "MesenCore.dll", 0x440EF98, 0x4A0, 0x55;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E710;
byte start2: "mednafen.exe", 0x136E72F;
byte stage: "mednafen.exe", 0x136E71D;
byte cage: "mednafen.exe", 0x136E720;
byte reset: "mednafen.exe", 0x136E8FC;
byte time: "mednafen.exe", 0x136E755;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667550;
byte start2: "mednafen.exe", 0x166756F;
byte stage: "mednafen.exe", 0x166755D;
byte cage: "mednafen.exe", 0x1667560;
byte reset: "mednafen.exe", 0x166773C;
byte time: "mednafen.exe", 0x1667595;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x78;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x97;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x85;
byte cage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x88;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x264;
byte time: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xBD;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x10;
byte start2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x2F;
byte stage: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x1D;
byte cage: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x20;
byte reset: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x1FC;
byte time: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x55;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x10;
byte start2: "retroarch.exe", 0x0E88F38, 0x408, 0x2F;
byte stage: "retroarch.exe", 0x0E88F38, 0x408, 0x1D;
byte cage: "retroarch.exe", 0x0E88F38, 0x408, 0x20;
byte reset: "retroarch.exe", 0x0E88F38, 0x408, 0x1FC;
byte time: "retroarch.exe", 0x0E88F38, 0x408, 0x55;
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
    if (current.stage == 0x01);
    {
        if (current.start == 0x01 && current.start2 == 0x01) return true;
        if (current.start == 0x02 && current.start2 == 0x02) return true;
    }
}
split
{
    if (settings ["Cage"] && old.cage == 0x00 && current.cage == 0x01) return(true);
    if (settings ["Level"] && current.stage == old.stage + 1) return true;
}
reset
{
    return (current.reset == 0xCC && current.stage == 0x01 && current.time == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Binary Land by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("Cage", false, "Split by Cage/Heart", "options");
    settings.Add("Level", true, "Split by Level", "options");
}
