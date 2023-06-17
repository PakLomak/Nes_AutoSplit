state("qFceux", "2.6.4")
{
byte level: "qfceux.exe", 0x0318340, 0x10;
byte start: "qfceux.exe", 0x0318340, 0x3B5;
byte start2: "qfceux.exe", 0x0318340, 0x3B6;
byte complete: "qfceux.exe", 0x0318340, 0x33;
byte pauseComplete: "qfceux.exe", 0x0318340, 0xEB;
byte BikeGlitch: "qfceux.exe", 0x0318340, 0x650;
byte BikeGlitch2: "qfceux.exe", 0x0318340, 0x318;
uint screen: "qfceux.exe", 0x0318340, 0x5A;
uint warpScreen: "qfceux.exe", 0x0318340, 0x6A;
}

state("Nestopia", "1.52")
{
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x10;
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3B5;
byte start2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3B6;
byte complete: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x33;
byte pauseComplete: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xEB;
byte BikeGlitch: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x650;
byte BikeGlitch2: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x318;
uint screen: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x5A;
uint warpScreen: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x6A;
}

state("Mednafen", "1.29.0")
{
byte level: "mednafen.exe", 0x1667550;
byte start: "mednafen.exe", 0x16678F5;
byte start2: "mednafen.exe", 0x16678F6;
byte complete: "mednafen.exe", 0x1667573;
byte pauseComplete: "mednafen.exe", 0x166762B;
byte BikeGlitch: "mednafen.exe", 0x1667B90;
byte BikeGlitch2: "mednafen.exe", 0x1667858;
uint screen: "mednafen.exe", 0x166759A;
uint warpScreen: "mednafen.exe", 0x16675AA;
}

state("Mesen", "0.9.9")
{
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x10;
byte start: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3B5;
byte start2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3B6;
byte complete: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x33;
byte pauseComplete: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0xEB;
byte BikeGlitch: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x650;
byte BikeGlitch2: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x318;
uint screen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x5A;
uint warpScreen: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x6A;
}

startup
{
    settings.Add("main", false, "AutoSplitter for Battletoads by BroDMax");
	settings.Add("main3", false, "--https://github.com/BroDMax", "main");
    settings.Add("gLevels", true, "Levels");
    settings.Add("gWarps", true, "Warps");
    
    settings.Add("lvl1", true, "Ragnarok's Canyon", "gLevels");
    settings.Add("lvl2", true, "Wookie Hole", "gLevels");
    settings.Add("lvl3", true, "Turbo Tunnel", "gLevels");
    settings.Add("lvl4", true, "Arctic Caverns", "gLevels");
    settings.Add("lvl5", true, "Surf City", "gLevels");
    settings.Add("lvl6", true, "Karnath's Lair", "gLevels");
    settings.Add("lvl7", true, "Volkmire's Inferno", "gLevels");
    settings.Add("lvl8", true, "Intruder Excluder", "gLevels");
    settings.Add("lvl9", true, "Terra Tubes", "gLevels");
    settings.Add("lvl10", true, "Rat Race", "gLevels");
    settings.Add("lvl11", true, "Clinger Winger", "gLevels");
    settings.Add("lvl12", true, "The Revolution", "gLevels");
    settings.Add("lvl13", true, "Armageddon", "gLevels");
    
    settings.Add("warp1", true, "Warp in Level 1", "gWarps");
    settings.Add("warp2", true, "Glitch in Turbo Tunnel", "gWarps");
    settings.Add("warp3", true, "Warp in Level 3", "gWarps");
    settings.Add("warp4", true, "Warp in Level 4", "gWarps");
    settings.Add("warp6", true, "Warp in Level 6", "gWarps");
    settings.Add("warp10", true, "Warp in Level 10", "gWarps");
}

split
{
    if ((old.complete != 0x81) && (current.complete == 0x81) && ((current.pauseComplete & 0xFE) == 0x80))
    {
        switch((int)current.level)
        {
            case 1:
                if (settings["lvl1"]) return true;
                break;
            case 2:
                if (settings["lvl2"]) return true;
                break;
            case 3:
                if (settings["lvl3"]) return true;
                break;
            case 4:
                if (settings["lvl4"]) return true;
                break;
            case 5:
                if (settings["lvl12"]) return true;
                break;
            case 6:
                if (settings["lvl7"]) return true;
                break;
            case 7:
                if (settings["lvl8"]) return true;
                break;
            case 8:
                if (settings["lvl6"]) return true;
                break;
            case 9:
                if (settings["lvl10"]) return true;
                break;
            case 10:
                if (settings["lvl11"]) return true;
                break;
            case 11:
                if (settings["lvl9"]) return true;
                break;
            case 12:
                if (settings["lvl5"]) return true;
                break;
        }
    }
	
	if ((current.BikeGlitch == 0x0F) && (old.BikeGlitch2 != 0x93) && (current.BikeGlitch2 == 0x93))
	{
		switch((int)current.level)
        {
            case 3:
				// Bike Glitch
                if (settings["warp2"]) return true;
                break;
            case 5:
				// The Revolution
                if (settings["lvl12"]) return true;
                break;
		}
	}
	
    // Armageddon (end game)
    if ((old.screen == 0x0F241404) && (current.screen == 0x0F201C0C) && ((current.level & 0xFE) == 0xFE) && (settings["lvl13"])) return true;
    // Warps
    if (((old.warpScreen != 0x0F382205) && (current.warpScreen == 0x0F382205)) || ((old.warpScreen != 0x0F121620) && (current.warpScreen == 0x0F121620)))
    {
        switch((int)current.level)
        {
            case 1:
                if (settings["warp1"]) return true;
                break;
            case 3:
                if (settings["warp3"]) return true;
                break;
            case 4:
                if (settings["warp4"]) return true;
                break;
            case 8:
                if (settings["warp6"]) return true;
                break;
            case 9:
                if (settings["warp10"]) return true;
                break;
        }
    }
}

reset
{
    return ((old.level != 0x00) && (current.level == 0x00));
}

start
{
    return (current.level == 0x01) && (((old.start == 0x05) && (current.start == 0x04)) ||
    ((old.start2 == 0x05) && (current.start2 == 0x04)));
}
