state("qFceux", "2.6.4")
{
byte gmode: "qfceux.exe", 0x0318340, 0xA0;
byte fly: "qfceux.exe", 0x0318340, 0xB0;
byte stage: "qfceux.exe", 0x0318340, 0x50;
byte live: "qfceux.exe", 0x0318340, 0x53;
byte endg: "qfceux.exe", 0x0318340, 0x5C;
byte time: "qfceux.exe", 0x0318340, 0x3E;
byte pavuk: "qfceux.exe", 0x0318340, 0x7A9;
byte reset: "qfceux.exe", 0x0318340, 0x30;
}
state("Mesen", "0.9.9")
{
byte gmode: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xA0;
byte fly: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB0;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x50;
byte live: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x53;
byte endg: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x5C;
byte time: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3E;
byte pavuk: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x7A9;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x30;
}
state("Mesen", "2.0.0")
{
byte gmode: "MesenCore.dll", 0x440EF98, 0x4A0, 0xA0;
byte fly: "MesenCore.dll", 0x440EF98, 0x4A0, 0xB0;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x50;
byte live: "MesenCore.dll", 0x440EF98, 0x4A0, 0x53;
byte endg: "MesenCore.dll", 0x440EF98, 0x4A0, 0x5C;
byte time: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3E;
byte pavuk: "MesenCore.dll", 0x440EF98, 0x4A0, 0x7A9;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x30;
}
state("Mednafen", "0.9.48")
{
byte gmode: "mednafen.exe", 0x136E7A0;
byte fly: "mednafen.exe", 0x136E7B0;
byte stage: "mednafen.exe", 0x136E750;
byte live: "mednafen.exe", 0x136E753;
byte endg: "mednafen.exe", 0x136E75C;
byte time: "mednafen.exe", 0x136E73E;
byte pavuk: "mednafen.exe", 0x136EEA9;
byte reset: "mednafen.exe", 0x136E730;
}
state("Mednafen", "1.29.0")
{
byte gmode: "mednafen.exe", 0x16675E0;
byte fly: "mednafen.exe", 0x16675F0;
byte stage: "mednafen.exe", 0x1667590;
byte live: "mednafen.exe", 0x1667593;
byte endg: "mednafen.exe", 0x166759C;
byte time: "mednafen.exe", 0x166757E;
byte pavuk: "mednafen.exe", 0x1667CE9;
byte reset: "mednafen.exe", 0x1667570;
}
state("Nestopia", "1.40")
{
byte gmode: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x108;
byte fly: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x118;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB8;
byte live: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xBB;
byte endg: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xC4;
byte time: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA6;
byte pavuk: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x811;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x98;
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
	return (current.stage == 0x00 && current.live == 0x02 && old.gmode == 0x07 && current.gmode == 0x02 && current.fly == 0x01);
}
split
{
	if (current.stage == 0x07 && current.endg == 0xC0 && old.endg != 0xC0 && current.time == 0x02) return(true);
	if (settings["Jungle"] && current.stage == 0x02 && old.pavuk == 0x00 && current.pavuk == 0x01) return(true);
	if (settings["SM"] && current.stage != 0x07 && current.endg == 0xC0 && old.endg != 0xC0 && current.time == 0x02) return(true);
	if (settings["wtcd"] && old.gmode == 0x02 && current.gmode == 0x08 && current.time == 0x02) return(true);
	if (settings["stage"] && current.stage == old.stage + 1) return(true);
}
reset
{
	return (current.gmode == 0x00 && current.reset == 0x00);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Super_C by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("SM", true, "Split on music", "options");
	settings.Add("Jungle", false, "Split by jungle", "options");
	settings.Add("stage", false, "Split by level", "options");
	settings.Add("wtcd", false, "Split when the character disappeared", "options");
}
