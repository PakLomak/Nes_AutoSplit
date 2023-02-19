state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0xC0;
byte start2: "qfceux.exe", 0x0318340, 0x1F;
byte x: "qfceux.exe", 0x0318340, 0x1E;
byte bonus: "qfceux.exe", 0x0318340, 0x74;
byte stage: "qfceux.exe", 0x0318340, 0x72;
byte screen: "qfceux.exe", 0x0318340, 0x73;
byte boss_hp: "qfceux.exe", 0x0318340, 0x3D7;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xC0;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1F;
byte x: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1E;
byte bonus: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x74;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x72;
byte screen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x73;
byte boss_hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3D7;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0xC0;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1F;
byte x: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1E;
byte bonus: "MesenCore.dll", 0x440EF98, 0x4A0, 0x74;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x72;
byte screen: "MesenCore.dll", 0x440EF98, 0x4A0, 0x73;
byte boss_hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3D7;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E7C0;
byte start2: "mednafen.exe", 0x136E71F;
byte x: "mednafen.exe", 0x136E71E;
byte bonus: "mednafen.exe", 0x136E774;
byte stage: "mednafen.exe", 0x136E772;
byte screen: "mednafen.exe", 0x136E773;
byte boss_hp: "mednafen.exe", 0x136EAD7;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667600;
byte start2: "mednafen.exe", 0x166755F;
byte x: "mednafen.exe", 0x166755E;
byte bonus: "mednafen.exe", 0x16675B4;
byte stage: "mednafen.exe", 0x16675B2;
byte screen: "mednafen.exe", 0x16675B3;
byte boss_hp: "mednafen.exe", 0x1667917;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x128;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x87;
byte x: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x86;
byte bonus: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xDC;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xDA;
byte screen: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xDB;
byte boss_hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x43F;
}
start
{
    return (current.start2 == 0x0F && current.start >= 0x1A && current.stage == 0x00 && current.screen == 0x00);
}
split
{
    if (settings["Bonus_room"] && current.bonus == 0x09 && old.bonus != 0x09 && current.screen == 0x00) return(true); //Level splits
    if (settings["Before_boss"] && current.stage == 0x00 && current.screen == 0x05 && old.start2 == 0x10 && current.start2 == 0x0F) return(true);
    if (settings["Level"] && old.stage == 0x00 && current.stage == 0x01) return(true);
    if (settings["Before_boss"] && current.stage == 0x01 && old.screen == 0x01 && current.screen == 0x02) return(true);
    if (settings["Level"] && old.stage == 0x01 && current.stage == 0x02) return(true);
    if (settings["Before_boss"] && current.stage == 0x02 && old.screen == 0x00 && current.screen == 0x01) return(true);
    if (settings["Level"] && old.stage == 0x02 && current.stage == 0x03) return(true);
    if (settings["Level"] && old.stage == 0x03 && current.stage == 0x04) return(true);
    if (settings["Before_boss"] && current.stage == 0x04 && old.screen == 0x01 && current.screen == 0x02) return(true);
    if (settings["Level"] && old.stage == 0x04 && current.stage == 0x05) return(true);
    if (settings["Before_boss"] && current.stage == 0x05 && old.screen == 0x00 && current.screen == 0x01) return(true);
    if (settings["Level"] && current.stage == 0x06 && current.start2 == 0x1E && old.x != 0x1F && current.x == 0x1F) return(true);
    if (settings["Before_boss"] && current.stage == 0x06 && old.screen == 0x03 && current.screen == 0x04) return(true);
    if (settings["Level"] && current.stage == 0x07 && current.start2 == 0x1E && old.x != 0x1F && current.x == 0x1F) return(true);
    if (settings["Before_boss"] && current.stage == 0x07 && old.screen == 0x03 && current.screen == 0x04) return(true);
    if (settings["Level"] && current.stage == 0x08 && current.start2 == 0x1E && old.x != 0x1F && current.x == 0x1F) return(true);
    if (settings["Control_Room"] && current.stage == 0x08 && current.screen == 0x07 && old.start2 == 0x19 && current.start2 == 0x17) return(true);
    if (current.stage == 0x08 && current.screen == 0x07 && old.boss_hp != 0x00 && current.boss_hp == 0x00) return(true); //Fat Cat
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
reset
{
	return (current.start == 0x00 && current.start2 == 0x09 || current.start == 0x00 && current.start2 == 0x1F);
}
startup 
{
    refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Chip'n Dale Rescue Rangers 2 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/PakLomak", "main");
    settings.Add("options", true, "Options");
    settings.Add("Bonus_room", true, "Bonus Room", "options");
    settings.Add("Level", false, "Level", "options");
    settings.Add("Before_boss", false, "Before boss", "options");
    settings.Add("Control_Room", false, "Control Room (Before FatCat)", "options");
}
