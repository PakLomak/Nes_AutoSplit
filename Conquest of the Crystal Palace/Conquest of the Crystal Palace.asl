state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x8F;
byte level: "qfceux.exe", 0x0318340, 0x2B;
byte hp: "qfceux.exe", 0x0318340, 0x549;
byte music: "qfceux.exe", 0x0318340, 0xC3;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x8F;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2B;
byte hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x549;
byte music: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xC3;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x8F;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2B;
byte hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0x549;
byte music: "MesenCore.dll", 0x440EF98, 0x4A0, 0xC3;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E78F;
byte level: "mednafen.exe", 0x136E72B;
byte hp: "mednafen.exe", 0x136EC49;
byte music: "mednafen.exe", 0x136E7C3;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675CF;
byte level: "mednafen.exe", 0x166756B;
byte hp: "mednafen.exe", 0x1667A89;
byte music: "mednafen.exe", 0x1667603;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xF7;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x93;
byte hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x5B1;
byte music: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x12B;
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
    return(old.start == 0x00 && current.start == 0x05 && current.level == 0x01);
}
reset
{
    return(current.start == 0x00);
}
split
{
    if (current.level == old.level + 1) return true;
    if (current.level == 0x05 && current.music == 0x06 && current.hp == 0x00 && old.hp != 0x00) return true;
}
startup
{
	settings.Add("main", false, "AutoSplitter for Conquest of the Crystal Palace by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}