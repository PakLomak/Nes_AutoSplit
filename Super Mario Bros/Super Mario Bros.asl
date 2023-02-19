state("qFceux", "2.6.4")
{
byte play: "qfceux.exe", 0x0318340, 0x770;
byte world: "qfceux.exe", 0x0318340, 0x75F;
byte lvl: "qfceux.exe", 0x0318340, 0x760;
byte time: "qfceux.exe", 0x0318340, 0x7F8;
byte time1: "qfceux.exe", 0x0318340, 0x7FA;
}
state("Mesen", "0.9.9")
{
byte play: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x770;
byte world: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x75F;
byte lvl: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x760;
byte time: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x7F8;
byte time1: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x7FA;
}
state("Mesen", "2.0.0")
{
byte play: "MesenCore.dll", 0x440EF98, 0x4A0, 0x770;
byte world: "MesenCore.dll", 0x440EF98, 0x4A0, 0x75F;
byte lvl: "MesenCore.dll", 0x440EF98, 0x4A0, 0x760;
byte time: "MesenCore.dll", 0x440EF98, 0x4A0, 0x7F8;
byte time1: "MesenCore.dll", 0x440EF98, 0x4A0, 0x7FA;
}
state("Mednafen", "0.9.48")
{
byte play: "mednafen.exe", 0x136EE70;
byte world: "mednafen.exe", 0x136EE5F;
byte lvl: "mednafen.exe", 0x136EE60;
byte time: "mednafen.exe", 0x136EEF8;
byte time1: "mednafen.exe", 0x136EEFA;
}
state("Mednafen", "1.29.0")
{
byte play: "mednafen.exe", 0x1667CB0;
byte world: "mednafen.exe", 0x1667C9F;
byte lvl: "mednafen.exe", 0x1667CA0;
byte time: "mednafen.exe", 0x1667D38;
byte time1: "mednafen.exe", 0x1667D3A;
}
state("Nestopia", "1.40")
{
byte play: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7D8;
byte world: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7C7;
byte lvl: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7C8;
byte time: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x860;
byte time1: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x862;
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
    return (current.play == 0x01 && current.time == 0x04 && old.time1 == 0x01 && current.time1 == 0x00);
}
split
{
    if (current.world == old.world + 1) return true;
    if (old.lvl == 0x00 && current.lvl == 0x01) return true;
    if (current.world == 0x02 && old.lvl == 0x01 && current.lvl == 0x02) return true;
    if (current.world == 0x04 && old.lvl == 0x01 && current.lvl == 0x02) return true;
    if (current.world == 0x05 && old.lvl == 0x01 && current.lvl == 0x02) return true;
    if (current.world == 0x07 && old.lvl == 0x01 && current.lvl == 0x02) return true;
    if (old.lvl == 0x02 && current.lvl == 0x03) return true;
    if (old.lvl == 0x03 && current.lvl == 0x04) return true;
    if (current.world == 0x07 && current.lvl == 0x03 && old.play == 0x01 && current.play == 0x02) return true;
}
reset
{
    return (current.play == 0x00 && current.lvl == 0x00 && current.world == 0x00);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Super Mario Bros by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}