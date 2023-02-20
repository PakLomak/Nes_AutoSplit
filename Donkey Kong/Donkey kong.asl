state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0x9C;
byte music: "qfceux.exe", 0x0318340, 0xFB;
byte scene: "qfceux.exe", 0x0318340, 0x3;
byte z: "qfceux.exe", 0x0318340, 0xC7;
byte x: "qfceux.exe", 0x0318340, 0xC8;
byte demo: "qfceux.exe", 0x0318340, 0x58;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x9C;
byte music: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xFB;
byte scene: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3;
byte z: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xC7;
byte x: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xC8;
byte demo: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x58;
}
state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x9C;
byte music: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xFB;
byte scene: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3;
byte z: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xC7;
byte x: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xC8;
byte demo: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x58;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0x9C;
byte music: "MesenCore.dll", 0x440EF98, 0x4A0, 0xFB;
byte scene: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3;
byte z: "MesenCore.dll", 0x440EF98, 0x4A0, 0xC7;
byte x: "MesenCore.dll", 0x440EF98, 0x4A0, 0xC8;
byte demo: "MesenCore.dll", 0x440EF98, 0x4A0, 0x58;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E79C;
byte music: "mednafen.exe", 0x136E7FB;
byte scene: "mednafen.exe", 0x136E703;
byte z: "mednafen.exe", 0x136E7C7;
byte x: "mednafen.exe", 0x136E7C8;
byte demo: "mednafen.exe", 0x136E758;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x16675DC;
byte music: "mednafen.exe", 0x166763B;
byte scene: "mednafen.exe", 0x1667543;
byte z: "mednafen.exe", 0x1667607;
byte x: "mednafen.exe", 0x1667608;
byte demo: "mednafen.exe", 0x1667598;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x104;
byte music: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x163;
byte scene: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6B;
byte z: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x12F;
byte x: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x130;
byte demo: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xC0;
}
start
{
    return (current.start <= 0xEB && old.scene == 0x00 && current.scene == 0xC4 && current.demo == 0x00);
}
split
{
    if (old.music != 0x01 && current.music == 0x01) return(true);
    if (current.z == 0x01 && current.x == 0x01 && old.scene == 0xC4 && current.scene == 0x00) return(true);
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
reset
{
    return (current.start == 0x00 && current.scene == 0xFF);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Donkey Kong by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
