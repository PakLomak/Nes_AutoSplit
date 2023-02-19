state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x9;
byte start2: "qfceux.exe", 0x0318340, 0x2;
byte level: "qfceux.exe", 0x0318340, 0x20;
byte room: "qfceux.exe", 0x0318340, 0x37;
byte end: "qfceux.exe", 0x0318340, 0x1C;
byte end2: "qfceux.exe", 0x0318340, 0x98;
byte boss: "qfceux.exe", 0x0318340, 0x5A1;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x9;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x20;
byte room: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x37;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1C;
byte end2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x98;
byte boss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x5A1;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x9;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x20;
byte room: "MesenCore.dll", 0x440EF98, 0x4A0, 0x37;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1C;
byte end2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x98;
byte boss: "MesenCore.dll", 0x440EF98, 0x4A0, 0x5A1;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E709;
byte start2: "mednafen.exe", 0x136E702;
byte level: "mednafen.exe", 0x136E720;
byte room: "mednafen.exe", 0x136E737;
byte end: "mednafen.exe", 0x136E71C;
byte end2: "mednafen.exe", 0x136E798;
byte boss: "mednafen.exe", 0x136ECA1;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667549;
byte start2: "mednafen.exe", 0x1667542;
byte level: "mednafen.exe", 0x1667560;
byte room: "mednafen.exe", 0x1667577;
byte end: "mednafen.exe", 0x166755C;
byte end2: "mednafen.exe", 0x16675D8;
byte boss: "mednafen.exe", 0x1667AE1;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x71;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6A;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x88;
byte room: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x9F;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x84;
byte end2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x100;
byte boss: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x609;
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
    return (old.start2 == 0x1F && current.start2 == 0xA3 || old.start == 0x94 && current.start == 0xA1);
}
split
{
    if (current.level <= 0x03)
    {
        if (old.end == 0x08 && current.end == 0x02) return true;
    }
    if (current.level == 0x04)
    {
        if (old.room == 0x68 && current.room == 0x48) return true;
        if (old.room == 0x70 && current.room == 0x50) return true;
        if (old.room == 0x78 && current.room == 0x00) return true;
    }
    if (current.level == 0x05 && old.room == 0x48 && current.room == 0x00) return true;
    if (current.level == 0x06 && old.end == 0x08 && current.end == 0x02) return true;
    if (current.level == 0x07 && old.end2 == 0x1F && current.end2 == 0xBE && current.boss == 0x00) return true;
}
reset
{
    return (current.start == 0x92 && current.start2 == 0xF2 && current.level == 0x00 && current.room == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Bucky O'Hare by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}