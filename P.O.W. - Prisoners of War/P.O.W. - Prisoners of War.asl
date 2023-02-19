state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0xDC;
byte level: "qfceux.exe", 0x0318340, 0x47;
byte end: "qfceux.exe", 0x0318340, 0x39;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xDC;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x47;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x39;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0xDC;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x47;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x39;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E7DC;
byte level: "mednafen.exe", 0x136E747;
byte end: "mednafen.exe", 0x136E739;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166761C;
byte level: "mednafen.exe", 0x1667587;
byte end: "mednafen.exe", 0x1667579;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x144;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xAF;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA1;
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
    return(current.level == 0x00 && current.end == 0x03 && old.start == 0x00 && current.start == 0x0A);
}
split
{
    if (current.level == old.level + 1) return true;
    if (current.level == 0x05 && old.end == 0x03 && current.end == 0x04) return true;
}
reset
{
    return(current.end == 0x05 && current.level == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for P.O.W. - Prisoners of War by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}