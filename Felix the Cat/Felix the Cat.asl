state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x28;
byte boss: "qfceux.exe", 0x0318340, 0x42C;
byte music: "qfceux.exe", 0x0318340, 0xED;
byte level: "qfceux.exe", 0x0318340, 0x33;
byte reset: "qfceux.exe", 0x0318340, 0x3A9;
byte ingame: "qfceux.exe", 0x0318340, 0x616;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x28;
byte boss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x42C;
byte music: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xED;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x33;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3A9;
byte ingame: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x616;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x28;
byte boss: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x42C;
byte music: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xED;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x33;
byte reset: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3A9;
byte ingame: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x616;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x28;
byte boss: "MesenCore.dll", 0x440EF98, 0x4A0, 0x42C;
byte music: "MesenCore.dll", 0x440EF98, 0x4A0, 0xED;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x33;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3A9;
byte ingame: "MesenCore.dll", 0x440EF98, 0x4A0, 0x616;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E728;
byte boss: "mednafen.exe", 0x136EB2C;
byte music: "mednafen.exe", 0x136E7ED;
byte level: "mednafen.exe", 0x136E733;
byte reset: "mednafen.exe", 0x136EAA9;
byte ingame: "mednafen.exe", 0x136ED16;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667568;
byte boss: "mednafen.exe", 0x166796C;
byte music: "mednafen.exe", 0x166762D;
byte level: "mednafen.exe", 0x1667573;
byte reset: "mednafen.exe", 0x16678E9;
byte ingame: "mednafen.exe", 0x1667B56;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x90;
byte boss: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x494;
byte music: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x155;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x9B;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x411;
byte ingame: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x67E;
}
update
{
    //print(modules.First().ModuleMemorySize.ToString());
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
	if (old.start ==0x01 && current.start ==0x06) return true;
}
split
{
	if (current.boss == 0x00 && old.boss != 0x00 && current.music == 0xBF) return true;
	if (current.ingame == 0x01 && current.level == old.level + 1) return true;
}
reset
{
	return (current.reset == 0x00 && old.reset != 0x00);
}
startup 
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Felix the Cat by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
