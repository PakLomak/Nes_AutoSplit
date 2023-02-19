state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x3C;
byte stage: "qfceux.exe", 0x0318340, 0x42;
byte demo: "qfceux.exe", 0x0318340, 0x1F;
byte last: "qfceux.exe", 0x0318340, 0x4B;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3C;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x42;
byte demo: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1F;
byte last: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4B;
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
init
{
    if (modules.First().ModuleMemorySize == 91533312)
		version = "1.29.0";
    else if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
	if (modules.First().ModuleMemorySize == 11714560)
        version = "0.9.9";
	else if (modules.First().ModuleMemorySize == 196608) 
        version = "2.0.0";
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
