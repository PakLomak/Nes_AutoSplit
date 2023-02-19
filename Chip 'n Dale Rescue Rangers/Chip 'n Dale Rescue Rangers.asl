state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x82;
byte charter: "qfceux.exe", 0x0318340, 0x1BA;
byte stage: "qfceux.exe", 0x0318340, 0x31;
byte boss_hits: "qfceux.exe", 0x0318340, 0xEE;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x82;
byte charter: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1BA;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x31;
byte boss_hits: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xEE;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x82;
byte charter: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1BA;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x31;
byte boss_hits: "MesenCore.dll", 0x440EF98, 0x4A0, 0xEE;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E782;
byte charter: "mednafen.exe", 0x136E8BA;
byte stage: "mednafen.exe", 0x136E731;
byte boss_hits: "mednafen.exe", 0x136E7EE;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675C2;
byte charter: "mednafen.exe", 0x16676FA;
byte stage: "mednafen.exe", 0x1667571;
byte boss_hits: "mednafen.exe", 0x166762E;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xEA;
byte charter: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x222;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x99;
byte boss_hits: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x156;
}
start
{
    return (current.start == 0xB3 && current.charter == 0xF3);
}
split
{
    if (current.stage == 0x0D && old.stage != 0x0D) return(true); //Level splits
    if (old.boss_hits == 0x04 && current.boss_hits == 0x05 && current.stage == 0x0A) return(true); //Fat Cat
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
update
{
    //print(modules.First().ModuleMemorySize.ToString());
}
reset
{
	return (current.start == 0xB8 && current.charter == 0x10);
}
startup 
{
    refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Chip'n Dale Rescue Rangers by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/PakLomak", "main");
}
