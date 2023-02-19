state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x14;
byte start2: "qfceux.exe", 0x0318340, 0x4C;
byte reset: "qfceux.exe", 0x0318340, 0x4A;
byte z: "qfceux.exe", 0x0318340, 0xFC;
byte x: "qfceux.exe", 0x0318340, 0x4D;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x14;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4C;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4A;
byte z: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xFC;
byte x: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4D;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x14;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4C;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4A;
byte z: "MesenCore.dll", 0x440EF98, 0x4A0, 0xFC;
byte x: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4D;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E714;
byte start2: "mednafen.exe", 0x136E74C;
byte reset: "mednafen.exe", 0x136E74A;
byte z: "mednafen.exe", 0x136E7FC;
byte x: "mednafen.exe", 0x136E74D;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667554;
byte start2: "mednafen.exe", 0x166758C;
byte reset: "mednafen.exe", 0x166758A;
byte z: "mednafen.exe", 0x166763C;
byte x: "mednafen.exe", 0x166758D;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7C;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB4;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB2;
byte z: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x164;
byte x: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB5;
}
start
{
    return (current.start == 0x10 && current.start2 == 0x03 && current.reset == 0x01);
}
split
{
    if (old.x == 0x01 && current.x == 0x00) return(true);
    if (current.x == 0x06 && old.z == 0x10 && current.z == 0x00) return(true);
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
    return (current.start2 == 0x01 && current.reset == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Donkey Kong Jr by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
