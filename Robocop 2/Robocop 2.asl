state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x0;
byte demo: "qfceux.exe", 0x0318340, 0x59C;
byte level: "qfceux.exe", 0x0318340, 0x59;
byte Hp1: "qfceux.exe", 0x0318340, 0xA1;
byte Hp2: "qfceux.exe", 0x0318340, 0xA2;
byte reset: "qfceux.exe", 0x0318340, 0x58;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x0;
byte demo: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x59C;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x59;
byte Hp1: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xA1;
byte Hp2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xA2;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x58;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x0;
byte demo: "MesenCore.dll", 0x440EF98, 0x4A0, 0x59C;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x59;
byte Hp1: "MesenCore.dll", 0x440EF98, 0x4A0, 0xA1;
byte Hp2: "MesenCore.dll", 0x440EF98, 0x4A0, 0xA2;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x58;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E700;
byte demo: "mednafen.exe", 0x136EC9C;
byte level: "mednafen.exe", 0x136E759;
byte Hp1: "mednafen.exe", 0x136E7A1;
byte Hp2: "mednafen.exe", 0x136E7A2;
byte reset: "mednafen.exe", 0x136E758;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667540;
byte demo: "mednafen.exe", 0x1667ADC;
byte level: "mednafen.exe", 0x1667599;
byte Hp1: "mednafen.exe", 0x16675E1;
byte Hp2: "mednafen.exe", 0x16675E2;
byte reset: "mednafen.exe", 0x1667598;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x68;
byte demo: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x604;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xC1;
byte Hp1: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x109;
byte Hp2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x10A;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xC0;
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
    return (old.start == 0x03 && current.start == 0x01 && current.demo == 0x00);
}
split
{
    if (current.level == old.level + 1) return true;
    if (current.level == 0x0D && current.Hp1 == 0x00 && old.Hp2 == 0x01 && current.Hp2 == 0x00) return true;
}
reset
{
    return (current.reset == 0x00 && current.start == 0x00 && current.level == 0x00 && current.Hp1 == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Robocop 2 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
