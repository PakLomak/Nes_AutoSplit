state("qFceux", "2.6.4")
{
byte level: "qfceux.exe", 0x0318340, 0xB6;
byte reset: "qfceux.exe", 0x0318340, 0x21;
}
state("Mesen", "0.9.9")
{
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB6;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x21;
}
state("Mesen", "2.0.0")
{
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0xB6;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x21;
}
state("Mednafen", "0.9.48")
{
byte level: "mednafen.exe", 0x136E7B6;
byte reset: "mednafen.exe", 0x136E721;
}
state("Mednafen", "1.29.0")
{
byte level: "mednafen.exe", 0x16675F6;
byte reset: "mednafen.exe", 0x1667561;
}
state("Nestopia", "1.40")
{
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x11E;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x89;
}
start
{
	if(old.reset == 0x31 && current.reset == 0x79) return true;
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
split
{
	if(old.level == 0x05 && current.level == 0x00 || old.level == 0x04 && current.level == 0x00) return true;
}
reset
{
	return (current.reset ==0x00 && old.reset != 0x00);
}
startup 
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for SD Hero Soukessen-Taose! Aku no Gundan by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
