state("Fceux64", "2.6.6")
{
byte FrameTime: "fceux64.exe", 0x04D59E0, 0xB9;
byte Level: "fceux64.exe", 0x04D59E0, 0x5F;
byte BossHere: "fceux64.exe", 0x04D59E0, 0x70;
byte BossHP: "fceux64.exe", 0x04D59E0, 0xA8;
uint Time: "fceux64.exe", 0x04D59E0, 0xC5;
}
state("Mesen", "0.9.9")
{
byte FrameTime: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB9;
byte Level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x5F;
byte BossHere: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x70;
byte BossHP: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xA8;
uint Time: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xC5;
}
state("Mesen", "0.0.6")
{
byte FrameTime: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xB9;
byte Level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x5F;
byte BossHere: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x70;
byte BossHP: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xA8;
uint Time: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xC5;
}
state("Mesen", "2.0.0")
{
byte FrameTime: "MesenCore.dll", 0x44D5E28, 0x118, 0x18, 0x40, 0x28, 0xB9;
byte Level: "MesenCore.dll", 0x44D5E28, 0x118, 0x18, 0x40, 0x28, 0x5F;
byte BossHere: "MesenCore.dll", 0x44D5E28, 0x118, 0x18, 0x40, 0x28, 0x70;
byte BossHP: "MesenCore.dll", 0x44D5E28, 0x118, 0x18, 0x40, 0x28, 0xA8;
uint Time: "MesenCore.dll", 0x44D5E28, 0x118, 0x18, 0x40, 0x28, 0xC5;
}
state("Mednafen", "0.9.48")
{
byte FrameTime: "mednafen.exe", 0x136E7B9;
byte Level: "mednafen.exe", 0x136E75F;
byte BossHere: "mednafen.exe", 0x136E770;
byte BossHP: "mednafen.exe", 0x136E7A8;
uint Time: "mednafen.exe", 0x136E7C5;
}
state("Mednafen", "1.29.0")
{
byte FrameTime: "mednafen.exe", 0x16675F9;
byte Level: "mednafen.exe", 0x166759F;
byte BossHere: "mednafen.exe", 0x16675B0;
byte BossHP: "mednafen.exe", 0x16675E8;
uint Time: "mednafen.exe", 0x1667605;
}
state("Nestopia", "1.40")
{
byte FrameTime: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x121;
byte Level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xC7;
byte BossHere: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xD8;
byte BossHP: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x110;
uint Time: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x12D;
}
state("Nestopia", "1.52")
{
byte FrameTime: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xB9;
byte Level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x5F;
byte BossHere: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x70;
byte BossHP: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xA8;
uint Time: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xC5;
}
state("Retroarch", "Mesen")
{
byte FrameTime: "mesen_libretro.dll", 0x0036F040, 0x60, 0x88, 0x100, 0x10, 0x120, 0x8, 0xB9;
byte Level: "mesen_libretro.dll", 0x0036F040, 0x60, 0x88, 0x100, 0x10, 0x120, 0x8, 0x5F;
byte BossHere: "mesen_libretro.dll", 0x0036F040, 0x60, 0x88, 0x100, 0x10, 0x120, 0x8, 0x70;
byte BossHP: "mesen_libretro.dll", 0x0036F040, 0x60, 0x88, 0x100, 0x10, 0x120, 0x8, 0xA8;
uint Time: "mesen_libretro.dll", 0x0036F040, 0x60, 0x88, 0x100, 0x10, 0x120, 0x8, 0xC5;
}
update
{
    print(current.Level.ToString("X2"));
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
start
{
    if (current.FrameTime == 0x01 && current.Level == 0x00 && current.Time == 0x00000502) vars.start = true;
    if (old.FrameTime == 0x1E && current.FrameTime != 0x1E && vars.start) {
        vars.start = false;
        return true;
}
}
split
{
    if (settings["All_Levels"] && current.Level == old.Level + 1) return true;
    if (settings["Levels"]){
        if (old.Level == 0x03 && current.Level == 0x04) return true; // The Bio-Lab -> Desert/Caves
        if (old.Level == 0x09 && current.Level == 0x0A) return true; // 2 -> Jungle/Caves
        if (old.Level == 0x0F && current.Level == 0x10) return true; // 3 -> Castle Rock Defense Systems
        if (old.Level == 0x14 && current.Level == 0x15) return true; // 4 -> Castle Rock Fortress
        if (old.Level == 0x1D && current.Level == 0x1E) return true; // 5 -> Subspace Rift
        if (old.Level == 0x23 && current.Level == 0x24) return true; // 6 -> The Ancient Ship of Doom
    }
    if (settings["SubLevels"]){
        if (old.Level == 0x04 && current.Level == 0x05) return true; // 2-1 -> 2-2
        if (old.Level == 0x0A && current.Level == 0x0B) return true; // Jungle 3-1 -> Caves 3-2 
        if (old.Level == 0x10 && current.Level == 0x11) return true; // 4-1 -> 4-2
        if (old.Level == 0x17 && current.Level == 0x18) return true; // 5-1 -> 5-2
        if (old.Level == 0x20 && current.Level == 0x21) return true; // 6-1 -> 6-2
        if (old.Level == 0x24 && current.Level == 0x25) return true; // 7-1 -> 7-2
        if (old.Level == 0x28 && current.Level == 0x29) return true; // 7-2 -> 7-3
    }
    if (settings["Time"] && old.BossHP == 0x01 && current.BossHP == 0x00) vars.SplitTime = true;
    if (current.Level != 0x2F && current.Time == 0x00000000 && vars.SplitTime){
        vars.SplitTime = false;
        return true;
    }
    if (settings["Mantis_Warrior"] && old.Level == 0x02 && current.Level == 0x03) return true; // Mantis Warrior
    if (settings["Night_Diver"] && old.Level == 0x08 && current.Level == 0x09) return true; // Night Diver
    if (settings["Great_Koganei"] && old.Level == 0x0E && current.Level == 0x0F) return true; // Great Koganei
    if (settings["Sandeater"] && old.Level == 0x13 && current.Level == 0x14) return true; // Sandeater
    if (settings["Ryu_Clone"] && old.Level == 0x1C && current.Level == 0x1D) return true; // Ryu Clone
    if (settings["Mutated_Foster"] && old.Level == 0x22 && current.Level == 0x23) return true; // Mutated Foster
    if (settings["Clancy_1st_Form"] && old.Level == 0x2C && current.Level == 0x2D) return true; // Clancy (1st Form)
    if (settings["Clancy_2nd_Form"] && old.Level == 0x2D && current.Level == 0x2E) return true; // Clancy (2nd Form)
    if (settings["Ancient_Security_Robot"] && old.Level == 0x2E && current.Level == 0x2F) return true; // Ancient Security Robot
    if (old.Level == 0x2F && current.Level == 0x30) return true;
}
reset
{
    if (current.Level == 0x00 && current.FrameTime == 0x00 && current.BossHP == 0x00 && current.Time == 0x00000000 && current.BossHere == 0x00) return true;
}
startup
{
    settings.Add("main", false, "AutoSplitter for Power Blade by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("All_Levels", true, "Split by Room's", "options");
    settings.Add("Levels", true, "Split by Levels", "options");
    settings.Add("Time", true, "Split by Timer", "options");
    settings.Add("SubLevels", true, "Split by Sub Levels", "options");
    settings.Add("boss", true, "Before Boss");
    settings.Add("Mantis_Warrior", false, "Mantis Warrior", "boss");
    settings.Add("Night_Diver", false, "Night Diver", "boss");
    settings.Add("Great_Koganei", false, "Great Koganei", "boss");
    settings.Add("Sandeater", false, "Sandeater", "boss");
    settings.Add("Ryu_Clone", false, "Ryu Clone", "boss");
    settings.Add("Mutated_Foster", false, "Mutated Foster", "boss");
    settings.Add("Clancy_1st_Form", false, "Clancy 1st Form", "boss");
    settings.Add("Clancy_2nd_Form", false, "Clancy 2nd Form", "boss");
    settings.Add("Ancient_Security_Robot", false, "Ancient Security Robot", "boss");
}