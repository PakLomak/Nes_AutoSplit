state("qFceux", "2.6.4")
{
byte scene: "qfceux.exe", 0x0318340, 0x20;
byte stage: "qfceux.exe", 0x0318340, 0x4C;
byte inputstatus: "qfceux.exe", 0x0318340, 0x21;
byte animation: "qfceux.exe", 0x0318340, 0xB8;
byte boss: "qfceux.exe", 0x0318340, 0x664;
byte room: "qfceux.exe", 0x0318340, 0x56;
byte bossrush: "qfceux.exe", 0x0318340, 0x73;
byte reset: "qfceux.exe", 0x0318340, 0x21;
}
state("Mesen", "0.9.9")
{
byte scene: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x20;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x4C;
byte inputstatus: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x21;
byte animation: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB8;
byte boss: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x664;
byte room: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x56;
byte bossrush: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x73;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x21;
}
state("Mesen", "2.0.0")
{
byte scene: "MesenCore.dll", 0x440EF98, 0x4A0, 0x20;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0x4C;
byte inputstatus: "MesenCore.dll", 0x440EF98, 0x4A0, 0x21;
byte animation: "MesenCore.dll", 0x440EF98, 0x4A0, 0xB8;
byte boss: "MesenCore.dll", 0x440EF98, 0x4A0, 0x664;
byte room: "MesenCore.dll", 0x440EF98, 0x4A0, 0x56;
byte bossrush: "MesenCore.dll", 0x440EF98, 0x4A0, 0x73;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0x21;
}
state("Mednafen", "0.9.48")
{
byte scene: "mednafen.exe", 0x136E720;
byte stage: "mednafen.exe", 0x136E74C;
byte inputstatus: "mednafen.exe", 0x136E721;
byte animation: "mednafen.exe", 0x136E7B8;
byte boss: "mednafen.exe", 0x136ED64;
byte room: "mednafen.exe", 0x136E756;
byte bossrush: "mednafen.exe", 0x136E773;
byte reset: "mednafen.exe", 0x136E721;
}
state("Mednafen", "1.29.0")
{
byte scene: "mednafen.exe", 0x1667560;
byte stage: "mednafen.exe", 0x166758C;
byte inputstatus: "mednafen.exe", 0x1667561;
byte animation: "mednafen.exe", 0x16675F8;
byte boss: "mednafen.exe", 0x1667BA4;
byte room: "mednafen.exe", 0x1667596;
byte bossrush: "mednafen.exe", 0x16675B3;
byte reset: "mednafen.exe", 0x1667561;
}
state("Nestopia", "1.40")
{
byte scene: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x88;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xB4;
byte inputstatus: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x89;
byte animation: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x120;
byte boss: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x6CC;
byte room: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xBE;
byte bossrush: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0xDB;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x89;
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
	return (current.scene == 0x03 && current.inputstatus == 0x05);
}
split
{
	if (settings["Stage"] && current.stage != 0x00 && old.scene != 0x05 && current.scene == 0x05) return(true); //Stage
	if (settings["Stage"] && current.stage != 0x00 && old.scene != 0x09 && current.scene == 0x09) return(true); //Stage
	if (old.room == 0x0f && current.room == 0x10) return(true); //BossRush 6-1
	if (current.room == 0x10 && old.bossrush == 0x07 && current.bossrush == 0x08) return(true); //Warlock Stage
	if (current.room == 0x11 && old.animation == 0x00 && current.animation == 0x01) return(true); //WarlockTV
	if (settings["Boss"] && current.room == 0x02 && old.boss == 0xFF && current.boss == 0x00) return(true); //Spring-Heeled Jack
	if (settings["Boss"] && current.room == 0x05 && old.boss == 0xFF && current.boss == 0x00) return(true); //Bigfoot
	if (settings["Boss"] && current.room == 0x08 && old.boss == 0xFF && current.boss == 0x00) return(true); //Kraken
	if (settings["Boss"] && current.room == 0x0B && old.boss == 0xFF && current.boss == 0x00) return(true); //Gremlin
	if (settings["Boss"] && current.room == 0x0E && old.boss == 0xFF && current.boss == 0x00) return(true); //Medusa
	if (settings["Boss"] && current.room == 0x10 && current.bossrush == 0x08 && old.boss == 0xFF && current.boss == 0x00) return(true); //Warlock
}
reset
{
	return (current.scene == 0x00 && current.reset == 0x03);
}
startup
{
	refreshRate = 70;
	settings.Add("main", false, "AutoSplitter for Monster In My Pocket by AndyLee_");
	settings.Add("main3", false, "--https://www.twitch.tv/andylee_", "main");
	settings.Add("options", true, "Options");
	settings.Add("Stage", true, "Stage", "options");
	settings.Add("Boss", false, "Boss", "options");
}
