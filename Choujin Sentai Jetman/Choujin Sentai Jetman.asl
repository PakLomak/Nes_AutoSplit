state("Fceux64", "2.6.6")
{
byte Level: "fceux64.exe", 0x04D59E0, 0x40;
byte scene: "fceux64.exe", 0x04D59E0, 0x29;
byte LevelEnd: "fceux64.exe", 0x04D59E0, 0x16;
byte bosshp: "fceux64.exe", 0x04D59E0, 0x617;
}
state("Mesen", "0.9.9")
{
byte Level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x40;
byte scene: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x29;
byte LevelEnd: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x16;
byte bosshp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x617;
}
state("Mesen", "0.0.6")
{
byte Level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x40;
byte scene: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x29;
byte LevelEnd: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x16;
byte bosshp: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x617;
}
state("Mesen", "2.0.0")
{
byte Level: "MesenCore.dll", 0x44D5E28, 0x118, 0x18, 0x40, 0x28, 0x40;
byte scene: "MesenCore.dll", 0x44D5E28, 0x118, 0x18, 0x40, 0x28, 0x29;
byte LevelEnd: "MesenCore.dll", 0x44D5E28, 0x118, 0x18, 0x40, 0x28, 0x16;
byte bosshp: "MesenCore.dll", 0x44D5E28, 0x118, 0x18, 0x40, 0x28, 0x617;
}
state("Mednafen", "0.9.48")
{
byte Level: "mednafen.exe", 0x136E740;
byte scene: "mednafen.exe", 0x136E729;
byte LevelEnd: "mednafen.exe", 0x136E716;
byte bosshp: "mednafen.exe", 0x136ED17;
}
state("Mednafen", "1.29.0")
{
byte Level: "mednafen.exe", 0x1667580;
byte scene: "mednafen.exe", 0x1667569;
byte LevelEnd: "mednafen.exe", 0x1667556;
byte bosshp: "mednafen.exe", 0x1667B57;
}
state("Nestopia", "1.40")
{
byte Level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA8;
byte scene: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x91;
byte LevelEnd: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7E;
byte bosshp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x67F;
}
state("Nestopia", "1.52")
{
byte Level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x40;
byte scene: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x29;
byte LevelEnd: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x16;
byte bosshp: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x617;
}
state("Retroarch", "Mesen")
{
byte Level: "mesen_libretro.dll", 0x0036F040, 0x60, 0x88, 0x100, 0x10, 0x120, 0x8, 0x40;
byte scene: "mesen_libretro.dll", 0x0036F040, 0x60, 0x88, 0x100, 0x10, 0x120, 0x8, 0x29;
byte LevelEnd: "mesen_libretro.dll", 0x0036F040, 0x60, 0x88, 0x100, 0x10, 0x120, 0x8, 0x16;
byte bosshp: "mesen_libretro.dll", 0x0036F040, 0x60, 0x88, 0x100, 0x10, 0x120, 0x8, 0x617;
}
init
{
    vars.start = true;
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
	case 204800:
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
start{
    if (current.scene == 0x08 && old.Level == 0x00 && current.Level == 0x01){
        vars.bossDead = false;
        vars.bossLast = false;
        return true;
    }
}
split{
    if (settings["Level"] && current.scene == 0x0A && old.LevelEnd == 0x00 && current.LevelEnd == 0x01) return true;
    if (current.Level == 0x01 || current.Level == 0x02 || current.Level == 0x03 || current.Level == 0x04 || current.Level == 0x05)
	{
	if (current.scene == 0x0C && current.bosshp == 0x50) vars.bossDead = true;
    if (old.scene == 0x0C && current.scene == 0x08 && vars.bossDead == true){
        vars.bossDead = false;
        return true;
    }
	}
    if (current.Level == 0x06 && current.scene == 0x0C && current.bosshp == 0x50) vars.bossLast = true;
    if (old.bosshp != 0x00 && current.bosshp == 0x00 && vars.bossLast == true) return true;
}
reset{
    if (current.Level == 0x00 && current.scene == 0x00) return true;
}
startup
{
	settings.Add("main", false, "AutoSplitter for Choujin Sentai Jetman by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("Level", true, "Split by levels", "options");
}