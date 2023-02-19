state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x0;
byte input: "qfceux.exe", 0x0318340, 0x2;
byte stage: "qfceux.exe", 0x0318340, 0x3;
byte boss: "qfceux.exe", 0x0318340, 0x3C6;
byte boss2: "qfceux.exe", 0x0318340, 0x29;
byte message: "qfceux.exe", 0x0318340, 0x46;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x0;
byte input: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3;
byte boss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3C6;
byte boss2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x29;
byte message: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x46;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x0;
byte input: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3;
byte boss: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3C6;
byte boss2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x29;
byte message: "MesenCore.dll", 0x440EF98, 0x4A0, 0x46;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E700;
byte input: "mednafen.exe", 0x136E702;
byte stage: "mednafen.exe", 0x136E703;
byte boss: "mednafen.exe", 0x136EAC6;
byte boss2: "mednafen.exe", 0x136E729;
byte message: "mednafen.exe", 0x136E746;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667540;
byte input: "mednafen.exe", 0x1667542;
byte stage: "mednafen.exe", 0x1667543;
byte boss: "mednafen.exe", 0x1667906;
byte boss2: "mednafen.exe", 0x1667569;
byte message: "mednafen.exe", 0x1667586;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x68;
byte input: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6A;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B;
byte boss: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x42E;
byte boss2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x91;
byte message: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xAE;
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
    return (current.start == 1 && current.input == 1 && current.stage == 0);
}
split
{
    if (current.boss2 == 8 && old.boss != 0 && current.boss == 0 && current.stage == 1) return true;
    if (current.stage == 4 && old.message != 0x0C && current.message == 0x0C) return true;
    return (current.stage > old.stage && current.stage != 2);
}
reset
{
    return (current.start == 0 && current.boss2 == 0 && current.boss == 0);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Robocop 3 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
