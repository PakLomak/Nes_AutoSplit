state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x4F;
byte score: "qfceux.exe", 0x0318340, 0x119;
byte reset: "qfceux.exe", 0x0318340, 0x75;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4F;
byte score: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x119;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x75;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4F;
byte score: "MesenCore.dll", 0x440EF98, 0x4A0, 0x119;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x75;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E74F;
byte score: "mednafen.exe", 0x136E819;
byte reset: "mednafen.exe", 0x136E775;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166758F;
byte score: "mednafen.exe", 0x1667659;
byte reset: "mednafen.exe", 0x16675B5;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB7;
byte score: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x181;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xDD;
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
	return (old.start == 0x00 && current.start == 0x21);
}
split
{
	if (old.score == 0x04 && current.score == 0x05 || old.score == 0x04 && current.score == 0x06) return true;
}
reset
{
	return (current.reset == 0x00 && old.reset != 0x00);
}
startup 
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Galaxian by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
