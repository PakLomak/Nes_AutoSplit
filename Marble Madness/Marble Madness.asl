state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x48;
byte start2: "qfceux.exe", 0x0318340, 0x1D;
byte end: "qfceux.exe", 0x0318340, 0x8B;
byte stage: "qfceux.exe", 0x0318340, 0x34;
byte reset: "qfceux.exe", 0x0318340, 0x3;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x48;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1D;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x8B;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x34;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x48;
byte start2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1D;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x8B;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x34;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E748;
byte start2: "mednafen.exe", 0x136E71D;
byte end: "mednafen.exe", 0x136E78B;
byte stage: "mednafen.exe", 0x136E734;
byte reset: "mednafen.exe", 0x136E703;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667588;
byte start2: "mednafen.exe", 0x166755D;
byte end: "mednafen.exe", 0x16675CB;
byte stage: "mednafen.exe", 0x1667574;
byte reset: "mednafen.exe", 0x1667543;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB0;
byte start2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x85;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xF3;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x9C;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B;
}
start
{
    return (current.start == 0xFF && current.start2 == 0x3B);
}
split
{
    if (settings["Flag_split"] && old.end == 0x01 && current.end == 0x00) return(true); //Flag splits
    if (old.end != 0x00 && current.end == 0x00 && current.stage == 0x05) return(true); //End split
    return (settings["level_split"] && current.stage > old.stage); //Level splits
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
	return (current.reset == 0x04);
}
startup 
{
    refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Marble Madness by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/PakLomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("level_split", true, "Split by levels", "options");
    settings.Add("Flag_split", false, "Split by Flag", "options");
}
