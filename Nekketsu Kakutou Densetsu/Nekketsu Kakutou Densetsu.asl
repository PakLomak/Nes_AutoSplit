state("qFceux", "2.6.4")
{
byte fight: "qfceux.exe", 0x0318340, 0x641;
byte start: "qfceux.exe", 0x0318340, 0x301;
}
state("Mesen", "0.9.9")
{
byte fight: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x641;
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x301;
}
state("Mesen", "2.0.0")
{
byte fight: "MesenCore.dll", 0x440EF98, 0x4A0, 0x641;
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x301;
}
state("Mednafen", "0.9.48")
{
byte fight: "mednafen.exe", 0x136ED41;
byte start: "mednafen.exe", 0x136EA01;
}
state("Mednafen", "1.29.0")
{
byte fight: "mednafen.exe", 0x1667B81;
byte start: "mednafen.exe", 0x1667841;
}
state("Nestopia", "1.40")
{
byte fight: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6A9;
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x369;
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
	if (current.fight ==0x0A && old.fight != 0x0A) return(true);
	if (current.fight ==0x07 && old.fight != 0x07) return(true);
}
reset
{
	return (current.start == 0x00 && current.fight ==0x02);
}
