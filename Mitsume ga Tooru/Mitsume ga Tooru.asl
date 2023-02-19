state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x4;
byte imput: "qfceux.exe", 0x0318340, 0x32;
byte lvl: "qfceux.exe", 0x0318340, 0x41;
byte scene: "qfceux.exe", 0x0318340, 0x3;
byte end: "qfceux.exe", 0x0318340, 0x531;
byte end2: "qfceux.exe", 0x0318340, 0x530;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4;
byte imput: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x32;
byte lvl: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x41;
byte scene: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3;
byte end: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x531;
byte end2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x530;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4;
byte imput: "MesenCore.dll", 0x440EF98, 0x4A0, 0x32;
byte lvl: "MesenCore.dll", 0x440EF98, 0x4A0, 0x41;
byte scene: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3;
byte end: "MesenCore.dll", 0x440EF98, 0x4A0, 0x531;
byte end2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x530;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E704;
byte imput: "mednafen.exe", 0x136E732;
byte lvl: "mednafen.exe", 0x136E741;
byte scene: "mednafen.exe", 0x136E703;
byte end: "mednafen.exe", 0x136EC31;
byte end2: "mednafen.exe", 0x136EC30;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x1667544;
byte imput: "mednafen.exe", 0x1667572;
byte lvl: "mednafen.exe", 0x1667581;
byte scene: "mednafen.exe", 0x1667543;
byte end: "mednafen.exe", 0x1667A71;
byte end2: "mednafen.exe", 0x1667A70;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6C;
byte imput: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x9A;
byte lvl: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA9;
byte scene: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B;
byte end: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x599;
byte end2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x598;
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
    return (current.start == 0x07 && current.scene == 0x01);
}
split
{
    if (old.lvl == 0x03 && current.lvl == 0x04) return true; //boss 1
    if (old.lvl == 0x08 && current.lvl == 0x09) return true; //boss 2
    if (old.lvl == 0x10 && current.lvl == 0x11) return true; //boss 3
    if (old.lvl == 0x15 && current.lvl == 0x1C) return true; //boss 4
    if (old.lvl == 0x25 && current.lvl == 0x26) return true; //1st guardian
    if (old.lvl == 0x2C && current.lvl == 0x2D) return true; //2d guardian
    if (old.lvl == 0x34 && current.lvl == 0x35) return true; //3d guardian
    if (current.lvl == 0x37 && old.end == 0x1F && current.end == 0x20) return true;
    if (current.lvl == 0x38 && old.end2 == 0x1F && current.end2 == 0x20) return true;
}
reset
{
    return (current.start == 0x00 && current.scene == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Mitsume ga Tooru by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
