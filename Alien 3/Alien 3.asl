state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x1FB;
byte screen: "qfceux.exe", 0x0318340, 0x39;
byte stage: "qfceux.exe", 0x0318340, 0xA8;
byte menu: "qfceux.exe", 0x0318340, 0x7A7;
byte x: "qfceux.exe", 0x0318340, 0x41;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x1FB;
byte screen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x39;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xA8;
byte menu: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x7A7;
byte x: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x41;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x1FB;
byte screen: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x39;
byte stage: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xA8;
byte menu: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x7A7;
byte x: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x41;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x1FB;
byte screen: "MesenCore.dll", 0x440EF98, 0x4A0, 0x39;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0xA8;
byte menu: "MesenCore.dll", 0x440EF98, 0x4A0, 0x7A7;
byte x: "MesenCore.dll", 0x440EF98, 0x4A0, 0x41;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E8FB;
byte screen: "mednafen.exe", 0x136E739;
byte stage: "mednafen.exe", 0x136E7A8;
byte menu: "mednafen.exe", 0x136EEA7;
byte x: "mednafen.exe", 0x136E741;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166773B;
byte screen: "mednafen.exe", 0x1667579;
byte stage: "mednafen.exe", 0x16675E8;
byte menu: "mednafen.exe", 0x1667CE7;
byte x: "mednafen.exe", 0x1667581;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x263;
byte screen: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA1;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x110;
byte menu: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x80F;
byte x: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA9;
}
init
{
    if (modules.First().ModuleMemorySize == 90116096)
        version = "1.27.1";
    else if (modules.First().ModuleMemorySize == 93294592)
        version = "0.9.48";
    if (modules.First().ModuleMemorySize == 11714560)
        version = "0.9.9";
	else if (modules.First().ModuleMemorySize == 196608) 
        version = "2.0.0";
}
start
{
	return (current.screen == 0x9f && current.menu == 0x00 && current.x == 0x9D && current.start == 0xA4);
}
split
{
	if (current.stage == 0x0B && old.screen != 0xA7 && current.screen == 0xA7) return(true);
	if (settings["level_split"] && current.stage == old.stage + 1) return true;
}
reset
{
	return (current.screen == 0xA2);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Alien 3 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("options", true, "Options");
	settings.Add("level_split", true, "Split by levels", "options");
}
