class RscText
{
	type = 0;
	idc = -1;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0x100; 
	font = "Zeppelin32";
	SizeEx = 0.03921;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
};

class RscPicture
{
	access=0;
	type=0;
	idc=-1;
	style=48;
	colorBackground[]={0,0,0,0};
	colorText[]={1,1,1,1};
	font="TahomaB";
	sizeEx=0;
	lineSpacing=0;
	text="";
};

// Sounds
class CfgSounds {
    sounds[] = {};
    class startsignalReady {
        name = "";
        sound[] = {"\sounds\startsignalReady.ogg.", 0.5, 1};
        titles[] = {};
    };
    class startsignalGo {
        name = "";
        sound[] = {"\sounds\startsignalGo.ogg.", 0.5, 1};
        titles[] = {};
    };
};

// UI
class RscTitles {
    class Default
    {
        idd = -1;
        movingEnable = 0;
        duration = 4;
    };

    class player_gui:Default {
        idd = 6900;
        movingEnable = 0;
        duration = 100000;
        name = "playerGUI";
        onLoad = "uiNamespace setVariable ['player_display', _this select 0];";

        class controls {
            class laps: RscText {
				idc = 1;
				x = 0.3 * safezoneW + safezoneX;
				y = 0.859137 * safezoneH + safezoneY;
				w = 0.400445 * safezoneW;
				h = 0.139148 * safezoneH;
				text = "0";
				style = 0x02 + 0x10 + 0x200;
				lineSpacing = 1;
				sizeEx = 0.034;
            };
            class raceTime: RscText {
				idc = 2;
				x = 0.3 * safezoneW + safezoneX;
				y = 0.998285 * safezoneH + safezoneY;
				w = 0.400445 * safezoneW;
				h = 0.139148 * safezoneH;
				text = "00:00:00:0000";
				style = 0x02 + 0x10 + 0x200;
				lineSpacing = 1;
				sizeEx = 0.034;
            };
            class lapTime: RscText {
				idc = 3;
				x = 0.3 * safezoneW + safezoneX;
				y = 1.137433 * safezoneH + safezoneY;
				w = 0.400445 * safezoneW;
				h = 0.139148 * safezoneH;
				text = "00:00:00:0000";
				style = 0x02 + 0x10 + 0x200;
				lineSpacing = 1;
				sizeEx = 0.034;
            };
        };
    };

    class startSignal_gui:Default {
        idd = 6901;
        movingEnable = 0;
        duration = 100000;
        name = "startSignalGUI";
        onLoad = "uiNamespace setVariable ['startsignal_display', _this select 0];";

        class controls {
            class startlightBackground: RscPicture {
				idc = 1;
                text = "";
                colorBackground[]={0,0,0,1};
                colorText[]={1,1,1,0};
            };
            class startlight1: RscPicture {
				idc = 2;
                text = "";
	            colorBackground[]={0,0,0,0};
                colorText[]={0,1,1,1};
            };
            class startlight2: RscPicture {
				idc = 3;
                text = "";
	            colorBackground[]={0,0,0,0};
                colorText[]={0,1,1,1};
            };
            class startlight3: RscPicture {
				idc = 4;
                text = "";
	            colorBackground[]={0,0,0,0};
                colorText[]={0,1,0,1};
            };
            class startlight4: RscPicture {
				idc = 5;
                text = "";
	            colorBackground[]={0,0,0,0};
                colorText[]={1,0,0,1};
            };
        };
    };
};