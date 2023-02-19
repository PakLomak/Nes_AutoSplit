state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x64;
byte reset: "qfceux.exe", 0x0318340, 0x14;
byte split: "qfceux.exe", 0x0318340, 0x44;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x64;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x14;
byte split: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x44;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x64;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x14;
byte split: "MesenCore.dll", 0x440EF98, 0x4A0, 0x44;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E764;
byte reset: "mednafen.exe", 0x136E714;
byte split: "mednafen.exe", 0x136E744;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675A4;
byte reset: "mednafen.exe", 0x1667554;
byte split: "mednafen.exe", 0x1667584;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xCC;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7C;
byte split: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xAC;
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
	return (old.start == 0x00 && current.start == 0x01);
}
reset
{
	return (old.reset == 0x9C && current.reset == 0x9C);
}
split
{
	if (old.split == 0x01 && current.split == 0x03) return(true);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Donkey Kong 3 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
