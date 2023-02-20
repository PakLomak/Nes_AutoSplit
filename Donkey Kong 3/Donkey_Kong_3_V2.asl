state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x3A;
byte reset: "qfceux.exe", 0x0318340, 0x14;
byte beehive: "qfceux.exe", 0x0318340, 0x2B0;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3A;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x14;
byte beehive: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2B0;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3A;
byte reset: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x14;
byte beehive: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x2B0;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3A;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x14;
byte beehive: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2B0;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E73A;
byte reset: "mednafen.exe", 0x136E714;
byte beehive: "mednafen.exe", 0x136E9B0;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166757A;
byte reset: "mednafen.exe", 0x1667554;
byte beehive: "mednafen.exe", 0x16677F0;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA2;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7C;
byte beehive: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x318;
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
	return (old.start == 0x01 && current.start == 0x00);
}
reset
{
	return (old.reset == 0x9C && current.reset == 0x9C);
}
split
{
	if (old.beehive == 0x30 && current.beehive >= 0x31) return(true);
	if (old.beehive == 0x6f && current.beehive == 0xf4) return(true);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Donkey Kong 3 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
