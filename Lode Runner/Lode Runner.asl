state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x6;
byte stage: "qfceux.exe", 0x0318340, 0xA6;
byte scene: "qfceux.exe", 0x0318340, 0x1FF;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x6;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xA6;
byte scene: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1FF;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x6;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0xA6;
byte scene: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1FF;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E706;
byte stage: "mednafen.exe", 0x136E7A6;
byte scene: "mednafen.exe", 0x136E8FF;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667546;
byte stage: "mednafen.exe", 0x16675E6;
byte scene: "mednafen.exe", 0x166773F;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6E;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x10E;
byte scene: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x267;
}
start
{
    return (current.scene == 0xC4 && current.stage == 0x01);
}
split
{
	if (old.stage == 0x32 && current.stage == 0x01) return(true);
    return (current.scene == 0xC5 && current.stage > old.stage);
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
    return (current.scene == 0xC3 && current.stage == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Lode Runner by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
