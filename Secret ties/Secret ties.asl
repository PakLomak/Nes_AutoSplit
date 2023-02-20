state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x4F1;
byte stage: "qfceux.exe", 0x0318340, 0xF;
byte level: "qfceux.exe", 0x0318340, 0x7;
byte reiko: "qfceux.exe", 0x0318340, 0x10;
byte end: "qfceux.exe", 0x0318340, 0x3D;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4F1;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xF;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x7;
byte reiko: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x10;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3D;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4F1;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0xF;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x7;
byte reiko: "MesenCore.dll", 0x440EF98, 0x4A0, 0x10;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3D;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136EBF1;
byte stage: "mednafen.exe", 0x136E70F;
byte level: "mednafen.exe", 0x136E707;
byte reiko: "mednafen.exe", 0x136E710;
byte end: "mednafen.exe", 0x136E73D;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667A31;
byte stage: "mednafen.exe", 0x166754F;
byte level: "mednafen.exe", 0x1667547;
byte reiko: "mednafen.exe", 0x1667550;
byte end: "mednafen.exe", 0x166757D;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x559;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x77;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6F;
byte reiko: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x78;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA5;
}
start
{
    return (old.start != 0x01 && current.start == 0x01);
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
    if (current.stage == 0x05 && current.reiko == 0x48 && old.end == 0x00 && current.end == 0x01) return(true);
    return (current.stage == old.stage + 1);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Secret Ties by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
