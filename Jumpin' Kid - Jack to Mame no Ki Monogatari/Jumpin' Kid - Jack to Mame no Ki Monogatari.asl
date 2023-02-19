state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x327;
byte scene: "qfceux.exe", 0x0318340, 0x23;
byte scene2: "qfceux.exe", 0x0318340, 0x24;
byte scene3: "qfceux.exe", 0x0318340, 0x30;
byte frame: "qfceux.exe", 0x0318340, 0x323;
byte heart: "qfceux.exe", 0x0318340, 0x667;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x327;
byte scene: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x23;
byte scene2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x24;
byte scene3: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x30;
byte frame: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x323;
byte heart: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x667;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x327;
byte scene: "MesenCore.dll", 0x440EF98, 0x4A0, 0x23;
byte scene2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x24;
byte scene3: "MesenCore.dll", 0x440EF98, 0x4A0, 0x30;
byte frame: "MesenCore.dll", 0x440EF98, 0x4A0, 0x323;
byte heart: "MesenCore.dll", 0x440EF98, 0x4A0, 0x667;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136EA27;
byte scene: "mednafen.exe", 0x136E723;
byte scene2: "mednafen.exe", 0x136E724;
byte scene3: "mednafen.exe", 0x136E730;
byte frame: "mednafen.exe", 0x136EA23;
byte heart: "mednafen.exe", 0x136ED67;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667867;
byte scene: "mednafen.exe", 0x1667563;
byte scene2: "mednafen.exe", 0x1667564;
byte scene3: "mednafen.exe", 0x1667570;
byte frame: "mednafen.exe", 0x1667863;
byte heart: "mednafen.exe", 0x1667BA7;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x38F;
byte scene: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x8B;
byte scene2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x8C;
byte scene3: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x98;
byte frame: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x38B;
byte heart: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6CF;
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
    vars.first = 0;
}
start
{
    if (current.start == 0x10 && current.frame == 0x02)
    {
        vars.first = 0;
        return(true);
    }
}
split
{
    if (current.scene3 == 0xA5 && old.scene3 != 0xA5)
    {
        if (vars.first > 0) return(true);
        vars.first = vars.first + 1;
    }
    if (current.scene == 0xCE && current.scene2 == 0xB9 && old.heart == 0x00 && current.heart == 0x01) return(true);
}
reset
{
    return (current.scene == 0xC2 && current.scene2 == 0xA1);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Jumpin' Kid - Jack to Mame no Ki Monogatari by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
