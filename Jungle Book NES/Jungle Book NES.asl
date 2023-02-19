state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x1FC;
byte start2: "qfceux.exe", 0x0318340, 0x759;
byte level: "qfceux.exe", 0x0318340, 0x35C;
byte boss_hp: "qfceux.exe", 0x0318340, 0x554;
byte music: "qfceux.exe", 0x0318340, 0xFF;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1FC;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x759;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x35C;
byte boss_hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x554;
byte music: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xFF;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1FC;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x759;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x35C;
byte boss_hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0x554;
byte music: "MesenCore.dll", 0x440EF98, 0x4A0, 0xFF;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E8FC;
byte start2: "mednafen.exe", 0x136EE59;
byte level: "mednafen.exe", 0x136EA5C;
byte boss_hp: "mednafen.exe", 0x136EC54;
byte music: "mednafen.exe", 0x136E7FF;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166773C;
byte start2: "mednafen.exe", 0x1667C99;
byte level: "mednafen.exe", 0x166789C;
byte boss_hp: "mednafen.exe", 0x1667A94;
byte music: "mednafen.exe", 0x166763F;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x264;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7C1;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x3C4;
byte boss_hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x5BC;
byte music: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x167;
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
start
{
    return (current.start == 0xCC && current.start2 == 0x0C);
}
split
{
    if (current.level == 0x09 && old.boss_hp == 0x01 && current.boss_hp == 0x00) return true;
    if (settings["Before_Boss"] && current.level >= 0x01 && old.music != 0x37 && current.music == 0x37 && current.boss_hp == 0x18) return true;
    if (old.level == 0x00 && current.level == 0x01) return true;
    if (old.level == 0x01 && current.level == 0x02) return true;
    if (old.level == 0x02 && current.level == 0x03) return true;
    if (old.level == 0x03 && current.level == 0x04) return true;
    if (old.level == 0x04 && current.level == 0x05) return true;
    if (old.level == 0x05 && current.level == 0x06) return true;
    if (old.level == 0x06 && current.level == 0x07) return true;
    if (old.level == 0x07 && current.level == 0x08) return true;
    if (old.level == 0x08 && current.level == 0x09) return true;
}
reset
{
    return (current.start == 0x33 && current.start2 == 0xFF || current.start == 0x33 && current.start2 == 0x0C);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Jungle Book NES by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("Before_Boss", false, "Split before boss", "options");
}