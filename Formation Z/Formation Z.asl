state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x8B;
byte reset: "qfceux.exe", 0x0318340, 0x72;
byte time: "qfceux.exe", 0x0318340, 0x17;
byte boom: "qfceux.exe", 0x0318340, 0x762;
byte oil: "qfceux.exe", 0x0318340, 0x2C;
byte end: "qfceux.exe", 0x0318340, 0x22;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x8B;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x72;
byte time: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x17;
byte boom: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x762;
byte oil: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x2C;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x22;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x8B;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x72;
byte time: "MesenCore.dll", 0x440EF98, 0x4A0, 0x17;
byte boom: "MesenCore.dll", 0x440EF98, 0x4A0, 0x762;
byte oil: "MesenCore.dll", 0x440EF98, 0x4A0, 0x2C;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x22;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E78B;
byte reset: "mednafen.exe", 0x136E772;
byte time: "mednafen.exe", 0x136E717;
byte boom: "mednafen.exe", 0x136EE62;
byte oil: "mednafen.exe", 0x136E72C;
byte end: "mednafen.exe", 0x136E722;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675CB;
byte reset: "mednafen.exe", 0x16675B2;
byte time: "mednafen.exe", 0x1667557;
byte boom: "mednafen.exe", 0x1667CA2;
byte oil: "mednafen.exe", 0x166756C;
byte end: "mednafen.exe", 0x1667562;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xF3;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xDA;
byte time: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7F;
byte boom: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x7CA;
byte oil: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x94;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x8A;
}
start
{
    if (current.start == 0x00 && current.reset == 0xFF)
    {
        vars.bam = true;
        vars.STY = true;
        return true;
    }
}
split
{
    if (old.boom == 0x00 && current.boom == 0x03 && current.oil <= 0x0C && vars.bam == true)
    {
        vars.bam = false;
        return true;
    }
    if (old.end == 0x80 && current.end == 0x00 && vars.STY == true)
    {
        vars.STY = false;
        return true;
    }
    if (old.end == 0x82 && current.end == 0x00) return true;
    //if (old.time == 0x00 && current.time == 0x08) return(true);
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
    vars.bam = true;
    vars.STY = true;
}
reset
{
    return (current.start == 0xFF && current.reset == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Formation Z by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
