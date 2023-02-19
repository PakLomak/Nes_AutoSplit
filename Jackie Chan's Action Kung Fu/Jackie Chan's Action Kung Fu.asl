state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x71;
byte scene: "qfceux.exe", 0x0318340, 0x70C;
byte cont: "qfceux.exe", 0x0318340, 0x701;
byte boss_hp: "qfceux.exe", 0x0318340, 0x39;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x71;
byte scene: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x70C;
byte cont: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x701;
byte boss_hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x39;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x71;
byte scene: "MesenCore.dll", 0x440EF98, 0x4A0, 0x70C;
byte cont: "MesenCore.dll", 0x440EF98, 0x4A0, 0x701;
byte boss_hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0x39;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E771;
byte scene: "mednafen.exe", 0x136EE0C;
byte cont: "mednafen.exe", 0x136EE01;
byte boss_hp: "mednafen.exe", 0x136E739;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675B1;
byte scene: "mednafen.exe", 0x1667C4C;
byte cont: "mednafen.exe", 0x1667C41;
byte boss_hp: "mednafen.exe", 0x1667579;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xD9;
byte scene: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x774;
byte cont: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x769;
byte boss_hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xA1;
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
    return (current.start == 0x03 && current.cont == 0x05);
}
split
{
    if (old.scene == 0x08 && current.scene == 0x0A) return true;
    if (old.scene == 0x0C && current.scene == 0x0E) return true;
    if (old.scene == 0x10 && current.scene == 0x11) return true;
    if (old.scene == 0x16 && current.scene == 0x18) return true;
    if (old.scene == 0x1D && current.scene == 0x1E) return true;
    if (current.scene == 0x20 && old.boss_hp != 0x00 && current.boss_hp == 0x00) return true;
}
reset
{
    return (current.start == 0xFF && current.cont == 0xFF);
}