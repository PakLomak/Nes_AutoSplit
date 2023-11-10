state("Fceux64", "2.6.6")
{
byte start: "fceux64.exe", 0x04D59E0, 0x9C;
byte music: "fceux64.exe", 0x04D59E0, 0xFB;
byte scene: "fceux64.exe", 0x04D59E0, 0x3;
byte z: "fceux64.exe", 0x04D59E0, 0xC7;
byte x: "fceux64.exe", 0x04D59E0, 0xC8;
byte demo: "fceux64.exe", 0x04D59E0, 0x58;
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
state("Nestopia", "1.52")
{
byte start: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x9C;
byte music: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xFB;
byte scene: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x3;
byte z: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xC7;
byte x: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0xC8;
byte demo: "nestopia.exe", 0x0178020, 0xA0, 0xB18, 0xA1C, 0xA10, 0xA04, 0xAC4, 0x58;
}
state("Retroarch", "Mesen")
{
byte start: "retroarch.exe", 0x0E88F38, 0x408, 0x9C;
byte music: "retroarch.exe", 0x0E88F38, 0x408, 0xFB;
byte scene: "retroarch.exe", 0x0E88F38, 0x408, 0x3;
byte z: "retroarch.exe", 0x0E88F38, 0x408, 0xC7;
byte x: "retroarch.exe", 0x0E88F38, 0x408, 0xC8;
byte demo: "retroarch.exe", 0x0E88F38, 0x408, 0x58;
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
reset
{
    return (current.start == 0x00 && current.scene == 0xFF);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Donkey Kong by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
}
