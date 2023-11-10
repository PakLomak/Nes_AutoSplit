state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x3C;
byte stage: "fceux64.exe", 0x04D59E0, 0x42;
byte demo: "fceux64.exe", 0x04D59E0, 0x1F;
byte last: "fceux64.exe", 0x04D59E0, 0x4B;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3C;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x42;
byte demo: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1F;
byte last: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4B;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3C;
byte stage: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x42;
byte demo: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1F;
byte last: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x4B;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3C;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x42;
byte demo: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1F;
byte last: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4B;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E73C;
byte stage: "mednafen.exe", 0x136E742;
byte demo: "mednafen.exe", 0x136E71F;
byte last: "mednafen.exe", 0x136E74B;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166757C;
byte stage: "mednafen.exe", 0x1667582;
byte demo: "mednafen.exe", 0x166755F;
byte last: "mednafen.exe", 0x166758B;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA4;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xAA;
byte demo: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x87;
byte last: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB3;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3C;
byte stage: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x42;
byte demo: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x1F;
byte last: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x4B;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x3C;
byte stage: "retroarch.exe", 0x0E88F38, 0x408, 0x42;
byte demo: "retroarch.exe", 0x0E88F38, 0x408, 0x1F;
byte last: "retroarch.exe", 0x0E88F38, 0x408, 0x4B;
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
    return (current.stage == 0x00 && current.start == 0x03 && current.demo == 0x00);
}
split
{
    if (settings["Apartment_building"] && old.stage == 0x00 && current.stage == 0x01) return true; //Apartment building
    if (settings["Rocksteady"] && old.stage == 0x01 && current.stage == 0x02) return true; //Rocksteady
    if (settings["Bebop"] && old.stage == 0x02 && current.stage == 0x03) return true; //Bebop
    if (settings["Baxter_Stockman_H"] && old.stage == 0x03 && current.stage == 0x04) return true; //Baxter Stockman H
    if (settings["Tora"] && old.stage == 0x04 && current.stage == 0x05) return true; //Tora
    if (settings["Baxter_Stockman_M"] && old.stage == 0x05 && current.stage == 0x06) return true; //Baxter Stockman M
    if (settings["Highway"] && old.stage == 0x06 && current.stage == 0x07) return true; //Highway
    if (settings["Skate"] && old.stage == 0x07 && current.stage == 0x08) return true; //Skate
    if (settings["Granitor"] && old.stage == 0x08 && current.stage == 0x09) return true; //Granitor 
    if (settings["Shogun"] && old.stage == 0x09 && current.stage == 0x0A) return true; //Shogun
    if (settings["The_Technodrome"] && old.stage == 0x0A && current.stage == 0x0B) return true; //The Technodrome / General Traag
    if (settings["Krang_&_Shredder"] && current.stage == 0x0B && old.start == 0x04 && current.start == 0x05) return true; //Krang & Shredder
}
startup
{
	settings.Add("main", false, "AutoSplitter for Teenage Mutant Ninja Turtles II The Arcade Game by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Split");
    settings.Add("Apartment_building", false, "Apartment_building", "options");
    settings.Add("Rocksteady", true, "Rocksteady", "options");
    settings.Add("Bebop", true, "Sidewalk / Bebop", "options");
    settings.Add("Baxter_Stockman_H", true, "Sewers / Baxter Stockman H", "options");
    settings.Add("Tora", true, "Snowy park / Tora", "options");
    settings.Add("Baxter_Stockman_M", true, "Parking garage / Baxter Stockman M", "options");
    settings.Add("Highway", true, "Highway", "options");
    settings.Add("Skate", true, "Highway / Skate", "options");
    settings.Add("Granitor", true, "Factory / Granitor", "options");
    settings.Add("Shogun", true, "Dojo / Shogun", "options");
    settings.Add("The_Technodrome", true, "The Technodrome", "options");
    settings.Add("Krang_&_Shredder", true, "Krang & Shredder", "options");
}
