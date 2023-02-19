state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0xF3;
byte start2: "qfceux.exe", 0x0318340, 0xD4;
byte screen: "qfceux.exe", 0x0318340, 0x55;
byte lives: "qfceux.exe", 0x0318340, 0x20;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xF3;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xD4;
byte screen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x55;
byte lives: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x20;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0xF3;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0xD4;
byte screen: "MesenCore.dll", 0x440EF98, 0x4A0, 0x55;
byte lives: "MesenCore.dll", 0x440EF98, 0x4A0, 0x20;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E7F3;
byte start2: "mednafen.exe", 0x136E7D4;
byte screen: "mednafen.exe", 0x136E755;
byte lives: "mednafen.exe", 0x136E720;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667633;
byte start2: "mednafen.exe", 0x1667614;
byte screen: "mednafen.exe", 0x1667595;
byte lives: "mednafen.exe", 0x1667560;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x15B;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x13C;
byte screen: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xBD;
byte lives: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x88;
}
start
{
    return (current.start == 0x02 && current.start2 == 0x07 || current.start == 0x02 && current.start2 == 0x08);
}
split
{
    if (current.lives != 0x80 && current.start2 == 0x00 && old.screen != 0x04 && current.screen == 0x04) return(true);
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
reset
{
    return (current.start == 0x04 && current.start2 == 0x00 && current.screen == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Ice Climber by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
