state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x31B;
byte level: "qfceux.exe", 0x0318340, 0x300;
byte gate: "qfceux.exe", 0x0318340, 0x6F5;
byte hp: "qfceux.exe", 0x0318340, 0x6DA;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x31B;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x300;
byte gate: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x6F5;
byte hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x6DA;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x31B;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x300;
byte gate: "MesenCore.dll", 0x440EF98, 0x4A0, 0x6F5;
byte hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0x6DA;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136EA1B;
byte level: "mednafen.exe", 0x136EA00;
byte gate: "mednafen.exe", 0x136EDF5;
byte hp: "mednafen.exe", 0x136EDDA;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166785B;
byte level: "mednafen.exe", 0x1667840;
byte gate: "mednafen.exe", 0x1667C35;
byte hp: "mednafen.exe", 0x1667C1A;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x383;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x368;
byte gate: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x75D;
byte hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x742;
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
    return (old.start == 0x1C && current.start == 0x3C && current.level == 0x00);
}
split
{
    if (current.level == old.level + 1) return true;
    if (current.level == 0x07 && old.gate == 0x00 && current.gate == 0x02) return true;
    if (current.level == 0x0F && old.gate == 0x00 && current.gate == 0x01) return true;
    if (current.level == 0x17 && old.gate == 0x00 && current.gate == 0x02) return true;
    if (current.level == 0x1E && old.gate == 0x00 && current.gate == 0x04) return true;
    if (old.level == 0x1E && current.level == 0x63 && current.hp == 0x80) return true;
}
reset
{
    return (current.gate == 0x05 && current.level == 0x63);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Rod Land by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}