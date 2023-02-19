state("qFceux", "2.6.4")
{
byte level: "qfceux.exe", 0x0318340, 0x30;
byte gmode: "qfceux.exe", 0x0318340, 0x2C;
byte tas: "qfceux.exe", 0x0318340, 0x2D;
byte scroll: "qfceux.exe", 0x0318340, 0x6;
byte start: "qfceux.exe", 0x0318340, 0x18;
}
state("Mesen", "0.9.9")
{
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x30;
byte gmode: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2C;
byte tas: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2D;
byte scroll: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x6;
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x18;
}
state("Mesen", "2.0.0")
{
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x30;
byte gmode: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2C;
byte tas: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2D;
byte scroll: "MesenCore.dll", 0x440EF98, 0x4A0, 0x6;
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x18;
}
state("Mednafen", "0.9.48")
{
byte level: "mednafen.exe", 0x136E730;
byte gmode: "mednafen.exe", 0x136E72C;
byte tas: "mednafen.exe", 0x136E72D;
byte scroll: "mednafen.exe", 0x136E706;
byte start: "mednafen.exe", 0x136E718;
}
state("Mednafen", "1.29.0")
{
byte level: "mednafen.exe", 0x1667570;
byte gmode: "mednafen.exe", 0x166756C;
byte tas: "mednafen.exe", 0x166756D;
byte scroll: "mednafen.exe", 0x1667546;
byte start: "mednafen.exe", 0x1667558;
}
state("Nestopia", "1.40")
{
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x98;
byte gmode: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x94;
byte tas: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x95;
byte scroll: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6E;
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x80;
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
    print(modules.First().ModuleMemorySize.ToString());
}
start
{
    return (current.level == 0x00 && current.start == 0x05 && old.gmode == 0x03 && current.gmode == 0x04);
}
reset
{
    return (current.gmode == 0x00 && current.scroll == 0x48 && current.level == 0x00 && current.start == 0x00);
}
split
{
    if (settings["wtcd"] && old.tas == 0x01 && current.tas == 0x02 && current.level != 0x07) return true;
    if (current.level == 0x07 && old.tas != 0x01 && current.tas == 0x01) return true;
    if(settings["Level"])
    {
        if (old.level == 0x00 && current.level == 0x01) return true;
        if (old.level == 0x01 && current.level == 0x02) return true;
        if (old.level == 0x02 && current.level == 0x03) return true;
        if (old.level == 0x03 && current.level == 0x04) return true;
        if (old.level == 0x04 && current.level == 0x05) return true;
        if (old.level == 0x05 && current.level == 0x06) return true;
        if (old.level == 0x06 && current.level == 0x07) return true;
    }
}
startup
{
	settings.Add("main", false, "AutoSplitter for Contra by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("Level", true, "Split by Level", "options");
    settings.Add("wtcd", false, "Split when the character disappeared", "options");
}