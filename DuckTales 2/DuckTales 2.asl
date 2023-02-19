state("qFceux", "2.6.4")
{
byte start: "qfceux.exe", 0x0318340, 0xCE;
byte stage: "qfceux.exe", 0x0318340, 0xC8;
byte map0: "qfceux.exe", 0x0318340, 0x3AF;
byte map1: "qfceux.exe", 0x0318340, 0x3C3;
byte map2: "qfceux.exe", 0x0318340, 0x3D6;
byte map3: "qfceux.exe", 0x0318340, 0x3E5;
byte map4: "qfceux.exe", 0x0318340, 0x349;
byte even: "qfceux.exe", 0x0318340, 0xC7;
byte boss_hp: "qfceux.exe", 0x0318340, 0xB9;
byte reset: "qfceux.exe", 0x0318340, 0xB1;
}
state("Mesen", "0.9.9")
{
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xCE;
byte stage: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xC8;
byte map0: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3AF;
byte map1: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3C3;
byte map2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3D6;
byte map3: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3E5;
byte map4: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x349;
byte even: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xC7;
byte boss_hp: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB9;
byte reset: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xB1;
}
state("Mesen", "2.0.0")
{
byte start: "MesenCore.dll", 0x440EF98, 0x4A0, 0xCE;
byte stage: "MesenCore.dll", 0x440EF98, 0x4A0, 0xC8;
byte map0: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3AF;
byte map1: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3C3;
byte map2: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3D6;
byte map3: "MesenCore.dll", 0x440EF98, 0x4A0, 0x3E5;
byte map4: "MesenCore.dll", 0x440EF98, 0x4A0, 0x349;
byte even: "MesenCore.dll", 0x440EF98, 0x4A0, 0xC7;
byte boss_hp: "MesenCore.dll", 0x440EF98, 0x4A0, 0xB9;
byte reset: "MesenCore.dll", 0x440EF98, 0x4A0, 0xB1;
}
state("Mednafen", "0.9.48")
{
byte start: "mednafen.exe", 0x136E7CE;
byte stage: "mednafen.exe", 0x136E7C8;
byte map0: "mednafen.exe", 0x136EAAF;
byte map1: "mednafen.exe", 0x136EAC3;
byte map2: "mednafen.exe", 0x136EAD6;
byte map3: "mednafen.exe", 0x136EAE5;
byte map4: "mednafen.exe", 0x136EA49;
byte even: "mednafen.exe", 0x136E7C7;
byte boss_hp: "mednafen.exe", 0x136E7B9;
byte reset: "mednafen.exe", 0x136E7B1;
}
state("Mednafen", "1.29.0")
{
byte start: "mednafen.exe", 0x166760E;
byte stage: "mednafen.exe", 0x1667608;
byte map0: "mednafen.exe", 0x16678EF;
byte map1: "mednafen.exe", 0x1667903;
byte map2: "mednafen.exe", 0x1667916;
byte map3: "mednafen.exe", 0x1667925;
byte map4: "mednafen.exe", 0x1667889;
byte even: "mednafen.exe", 0x1667607;
byte boss_hp: "mednafen.exe", 0x16675F9;
byte reset: "mednafen.exe", 0x16675F1;
}
state("Nestopia", "1.40")
{
byte start: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x136;
byte stage: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x130;
byte map0: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x417;
byte map1: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x42B;
byte map2: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x43E;
byte map3: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x44D;
byte map4: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x3B1;
byte even: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x12F;
byte boss_hp: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x121;
byte reset: "nestopia.exe", 0x1B2BCC, 0x00, 0x08, 0x0C, 0x0C, 0x119;
}
start
{
    return (old.start == 0x00 && current.start == 0x02);
}
split
{
    if (settings["Level_complete"] && current.stage <= 0x06 && old.even == 0x00 && current.even == 0x02) return(true); //Level complete
    if (settings["Niagara_Map"] && current.stage == 0x00 && old.map0 == 0x01 && current.map0 == 0x00) return(true); //Niagara Map
    if (settings["Ship_Map"] && current.stage == 0x01 && old.map1 == 0x01 && current.map1 == 0x00) return(true); //Ship Map
    if (settings["Egypt_Map"] && current.stage == 0x02 && old.map2 == 0x01 && current.map2 == 0x00) return(true); //Egypt Map
    if (settings["Island_Map"] && current.stage == 0x03 && old.map3 == 0x01 && current.map3 == 0x00) return(true); //Island Map
    if (settings["Castle_Map"] && current.stage == 0x04 && old.map4 == 0x01 && current.map4 == 0x00) return(true); //Castle Map
    if (current.stage == 0x06 && old.boss_hp == 0x01 && current.boss_hp == 0x00) return(true);
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
    return (current.start == 0x00 && current.stage == 0x00 && current.reset == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Duck Tales 2 by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	settings.Add("Level_complete", true, "Split by Level", "options");
    settings.Add("Map's", true, "Map's");
    settings.Add("Niagara_Map", false, "Niagara", "Map's");
    settings.Add("Ship_Map", false, "Ship", "Map's");
    settings.Add("Egypt_Map", false, "Egypt", "Map's");
    settings.Add("Island_Map", false, "Island", "Map's");
    settings.Add("Castle_Map", false, "Castle", "Map's");
}
