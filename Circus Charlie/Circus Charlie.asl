state("qFceux", "2.6.4")
{
ushort completeLevel: "qfceux.exe", 0x0318340, 0x0;
byte startGame: "qfceux.exe", 0x0318340, 0x3;
byte level: "qfceux.exe", 0x0318340, 0x63;
int bonus: "qfceux.exe", 0x0318340, 0x340;
}
state("Mesen", "0.9.9")
{
ushort completeLevel: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x0;
byte startGame: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x63;
int bonus: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x340;
}
state("Mesen", "2.0.0")
{
ushort completeLevel: "MesenCore.dll", 0x440EF98, 0x4A0, 0x0;
byte startGame: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3;
byte level: "MesenCore.dll", 0x440EF98, 0x4A0, 0x63;
int bonus: "MesenCore.dll", 0x440EF98, 0x4A0, 0x340;
}
state("Mednafen", "0.9.48")
{
ushort completeLevel: "mednafen.exe", 0x136E700;
byte startGame: "mednafen.exe", 0x136E703;
byte level: "mednafen.exe", 0x136E763;
int bonus: "mednafen.exe", 0x136EA40;
}
state("Mednafen", "1.29.0")
{
ushort completeLevel: "mednafen.exe", 0x1667540;
byte startGame: "mednafen.exe", 0x1667543;
byte level: "mednafen.exe", 0x16675A3;
int bonus: "mednafen.exe", 0x1667880;
}
state("Nestopia", "1.40")
{
ushort completeLevel: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x68;
byte startGame: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B;
byte level: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xCB;
int bonus: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x3A8;
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
    return old.startGame == 0x00 && current.startGame == 0x40;
}

split
{
    if (current.level < 5)
    {
        return current.bonus == 0 && old.completeLevel != 0x0208 && current.completeLevel == 0x0208;
    }
    else
    {
        return old.completeLevel != 0x0108 && current.completeLevel == 0x0108;
    }
}

reset
{
    return old.startGame != 0x00 && current.startGame == 0x00;
}
startup 
{
	settings.Add("main", false, "AutoSplitter for CircusCharlie by BroDMax");
	settings.Add("main3", false, "--https://www.twitch.tv/BroDMax", "main");
}
