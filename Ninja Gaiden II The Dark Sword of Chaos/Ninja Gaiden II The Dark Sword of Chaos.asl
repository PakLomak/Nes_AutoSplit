state("Mesen", "0.0.6")
{
byte start: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xB0;
byte start2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x55;
byte stage: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x7E;
byte boss_hp: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x81;
byte time: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xAD;
byte time2: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0xAC;
byte imput: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x12;
}
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xB0;
byte start2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x55;
byte stage: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x7E;
byte boss_hp: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x81;
byte time: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xAD;
byte time2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xAC;
byte imput: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x12;
}
init
{
    vars.boss = false;
}
start
{
    if (old.start2 == 0x00 && current.start2 == 0x07)
    {
        vars.boss = false;
        return true;
    }
}
split
{
    /*if (settings["Time"])
    {
        if (current.boss_hp == 0x00) vars.boss = true;
        if (current.time == 0x00 && old.time2 != 0x00 && current.time2 == 0x00 && current.stage != 0x00 && vars.boss == true)
        {
            vars.boss = false;
            return true;
        }
    }*/
    if (settings["All"])
    {
    if (current.stage == old.stage + 1) return true;
    if (current.stage == 0x2F && current.boss_hp == 0x00 && current.time == 0x00 && old.time2 != 0x00 && current.time2 == 0x00) return true;
    }
    if (settings["Boss"])
    {
        if (old.stage == 0x02 && current.stage == 0x03) return true; // крыши
        if (old.stage == 0x03 && current.stage == 0x04) return true; //Босс
        if (old.stage == 0x04 && current.stage == 0x05) return true; // Поезд
        if (old.stage == 0x07 && current.stage == 0x08) return true; // Горы
        if (old.stage == 0x08 && current.stage == 0x09) return true; //Босс
        if (old.stage == 0x09 && current.stage == 0x0A) return true; // Лес
        if (old.stage == 0x0E && current.stage == 0x0F) return true; // Замок
        if (old.stage == 0x0F && current.stage == 0x10) return true; //Босс
        if (old.stage == 0x12 && current.stage == 0x13) return true; // Пещера
        if (old.stage == 0x15 && current.stage == 0x16) return true; // Водопад
        if (old.stage == 0x16 && current.stage == 0x17) return true; //Босс
        if (old.stage == 0x19 && current.stage == 0x1A) return true; // Замок
        if (old.stage == 0x1C && current.stage == 0x1D) return true; // Ледяной
        if (old.stage == 0x1D && current.stage == 0x1E) return true; //Босс
        if (old.stage == 0x20 && current.stage == 0x21) return true; // Руины
        if (old.stage == 0x21 && current.stage == 0x22) return true; // Мост
        if (old.stage == 0x22 && current.stage == 0x23) return true; //Босс
        if (old.stage == 0x27 && current.stage == 0x28) return true; // Долина
        if (old.stage == 0x2C && current.stage == 0x2D) return true; // Башня
        if (old.stage == 0x2D && current.stage == 0x2E) return true; //Босс
        if (old.stage == 0x2E && current.stage == 0x2F) return true; //Босс
        if (current.stage == 0x2F && current.boss_hp == 0x00 && current.time == 0x00 && old.time2 != 0x00 && current.time2 == 0x00) return true;
    }
}
reset
{
    if (current.stage == 0x00 && current.start == 0x00 && current.start2 == 0x00) return true;
}
startup
{
	settings.Add("main", false, "AutoSplitter for Rockman X by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
    settings.Add("options", true, "Options");
	//settings.Add("Time", true, "Split by time", "options");
	settings.Add("All", false, "Split by screens", "options");
    settings.Add("Boss", true, "Split by Levels & Boss", "options");
}