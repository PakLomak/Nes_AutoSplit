state("qFceux", "2.6.4")
{
byte screen: "qfceux.exe", 0x0318340, 0x18;
byte win: "qfceux.exe", 0x0318340, 0x19;
}
state("Mesen", "0.9.9")
{
byte screen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x18;
byte win: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x19;
}
state("Mesen", "2.0.0")
{
byte screen: "MesenCore.dll", 0x440EF98, 0x4A0, 0x18;
byte win: "MesenCore.dll", 0x440EF98, 0x4A0, 0x19;
}
state("Mednafen", "0.9.48")
{
byte screen: "mednafen.exe", 0x136E718;
byte win: "mednafen.exe", 0x136E719;
}
state("Mednafen", "1.29.0")
{
byte screen: "mednafen.exe", 0x1667558;
byte win: "mednafen.exe", 0x1667559;
}
state("Nestopia", "1.40")
{
byte screen: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x80;
byte win: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x81;
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
start
{
    return (current.screen == 0x03 && current.win == 0x02);
}
split
{
    if (current.screen == 0x08 && current.win == 0x0B && old.win != 0x0B) return true;
    if (current.screen == 0x07 && current.win == 0x02 && old.win != 0x02) return true;
}
startup
{
	settings.Add("main", false, "AutoSplitter for Power Blade by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
