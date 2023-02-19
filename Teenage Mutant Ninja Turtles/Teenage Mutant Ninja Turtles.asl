state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0xAC;
byte level: "qfceux.exe", 0x0318340, 0x48;
byte area: "qfceux.exe", 0x0318340, 0x49;
byte done: "qfceux.exe", 0x0318340, 0xB5;
byte hpBoss: "qfceux.exe", 0x0318340, 0x565;
byte continues: "qfceux.exe", 0x0318340, 0x46;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xAC;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x48;
byte area: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x49;
byte done: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB5;
byte hpBoss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x565;
byte continues: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x46;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0xAC;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x48;
byte area: "MesenCore.dll", 0x440EF98, 0x4A0, 0x49;
byte done: "MesenCore.dll", 0x440EF98, 0x4A0, 0xB5;
byte hpBoss: "MesenCore.dll", 0x440EF98, 0x4A0, 0x565;
byte continues: "MesenCore.dll", 0x440EF98, 0x4A0, 0x46;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E7AC;
byte level: "mednafen.exe", 0x136E748;
byte area: "mednafen.exe", 0x136E749;
byte done: "mednafen.exe", 0x136E7B5;
byte hpBoss: "mednafen.exe", 0x136EC65;
byte continues: "mednafen.exe", 0x136E746;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675EC;
byte level: "mednafen.exe", 0x1667588;
byte area: "mednafen.exe", 0x1667589;
byte done: "mednafen.exe", 0x16675F5;
byte hpBoss: "mednafen.exe", 0x1667AA5;
byte continues: "mednafen.exe", 0x1667586;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x114;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB0;
byte area: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB1;
byte done: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x11D;
byte hpBoss: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x5CD;
byte continues: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xAE;
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
    vars.water = true;
}
start
{
    if (current.level == 0x00 && current.area == 0x10 && current.continues == 0x03 && old.start == 0x00 && current.start >= 0x06)
    {
        vars.water = true;
        return true;
    }
}
split
{
    if (settings["done"] && current.level == 0x00 && current.area == 0x6C && old.done != 0x84 && current.done == 0x84) return true;
    if (settings["water"] && current.level == 0x01 && old.area == 0x16 && current.area == 0x7D && vars.water == true)
    {
        vars.water = false;
        return true;
    }
    if (settings["done"] && current.level == 0x01 && current.area == 0x7D && old.done != 0x87 && current.done == 0x87) return true;
    if (settings["done"] && current.level == 0x02 && current.area == 0xF2 && old.done != 0x88 && current.done == 0x88) return true;
    if (settings["done"] && current.level == 0x03 && current.area == 0x63 && old.done != 0x8A && current.done == 0x8A) return true;
    if (settings["done"] && current.level == 0x04 && current.area == 0xB7 && old.done != 0x8E && current.done == 0x8E) return true;
    if (settings["stage"] && current.level == old.level + 1) return(true);
    if (current.level == 0x05 && current.area == 0x14 && old.hpBoss != 0x00 && current.hpBoss == 0x00) return true;
}
reset 
{
    return (current.level == 0x00 && current.area == 0x00 && current.start == 0x00 && current.continues == 0x00);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Teenage Mutant Ninja Turtles by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("done", true, "Split Complete", "options");
    settings.Add("stage", false, "Split by level", "options");
    settings.Add("water", true, "Split by water lvl 2", "options");
}