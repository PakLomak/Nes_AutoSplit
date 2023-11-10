state("Fceux64", "2.6.6")
{
ushort completeLevel: "fceux64.exe", 0x04D59E0, 0x0;
byte startGame: "fceux64.exe", 0x04D59E0, 0x3;
byte level: "fceux64.exe", 0x04D59E0, 0x63;
int bonus: "fceux64.exe", 0x04D59E0, 0x340;
}
state("Mesen", "0.9.9")
{
ushort completeLevel: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x0;
byte startGame: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x3;
byte level: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x63;
int bonus: "MesenCore.dll", 0x42E0F30, 0xB8, 0x58, 0x340;
}
state("Mesen", "0.0.6")
{
ushort completeLevel: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x0;
byte startGame: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x3;
byte level: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x63;
int bonus: "MesenCore.dll", 0x42FA9C0, 0xB8, 0x58, 0x340;
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
state("Nestopia", "1.52")
{
ushort completeLevel: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x0;
byte startGame: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3;
byte level: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x63;
int bonus: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x340;
}
state("Retroarch", "Mesen")
{
ushort completeLevel: "retroarch.exe", 0x0E88F38, 0x408, 0x0;
byte startGame: "retroarch.exe", 0x0E88F38, 0x408, 0x3;
byte level: "retroarch.exe", 0x0E88F38, 0x408, 0x63;
int bonus: "retroarch.exe", 0x0E88F38, 0x408, 0x340;
}

init
{
int memSize = modules.First().ModuleMemorySize;
switch (memSize)
{
	case 91533312:
		print("Detected Mednafen 1.29.0");
		version = "1.29.0";
		break;
	case 90116096:
		print("Detected Mednafen 1.27.1");
		version = "1.27.1";
		break;
	case 93294592:
		print("Detected Mednafen 0.9.48");
		version = "0.9.48";
		break;
	case 11714560:
		print("Detected Mesen 0.9.9");
		version = "0.9.9";
		break;
	case 10412032:
		print("Detected Mesen 0.9.8");
		version = "0.9.8";
		break;
	case 10067968:
		print("Detected Mesen 0.9.7");
		version = "0.9.7";
		break;
	case 196608:
		print("Detected Mesen 2.0.0");
		version = "2.0.0";
		break;
	case 5283840:
		print("Detected Mesen 0.0.6");
		version = "0.0.6";
		break;
	case 8069120:
		print("Detected FCEUX 2.6.6");
		version = "2.6.6";
		break;
	case 2113536:
		print("Detected Nestopia 1.40");
		version = "1.40";
		break;
	case 1974272:
		print("Detected Nestopia 1.52");
		version = "1.52";
		break;
	default:
		print("Unknown Emulator");
		version = "";
		break;
}
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
