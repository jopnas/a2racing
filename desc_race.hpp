// Sounds
class CfgSounds {
    sounds[] = {};
    class startsignalReady {
        name = "";
        sound[] = {"sounds\startsignalReady.ogg", 0.5, 0.7};
        titles[] = {};
    };
    class startsignalGo {
        name = "";
        sound[] = {"sounds\startsignalGo.ogg", 0.5, 0.7};
        titles[] = {};
    };  name = "";
  titles[] = {};
};

// UI
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

class counterText : RscText {
	x = 0.5 * safezoneW + safezoneX;
	w = 0.5 * safezoneW;
	h = 0.15 * safezoneH;
	style = 0x00 + 0x10 + 0x200;
	lineSpacing = 1;
	sizeEx = 0.034;
};

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
            class laps: counterText {
				idc = 1;
				y = 0.5 * safezoneH + safezoneY;
				text = "0";
            };
            class raceTime: counterText {
				idc = 2;
				y = 0.52 * safezoneH + safezoneY;
				text = "00:00:00:0000";
            };
            class lapTime: counterText {
				idc = 3;
				y = 0.54 * safezoneH + safezoneY;
				text = "00:00:00:0000";
            };
        };
    };

	class startlightDefault: RscPicture {
		text = "pics\capthat_transmitter_led_off.paa";
		x = 0.5 * safezoneW + safezoneX;
		w = 0.05 * safezoneW;
		h = 0.08 * safezoneH;
		colorBackground[]={0,0,0,0};
	};
    class startSignal_gui:Default {
        idd = 6901;
        movingEnable = 0;
        duration = 100000;
        name = "startSignalGUI";
        onLoad = "uiNamespace setVariable ['startsignal_display', _this select 0];";

        class controls {
            class startlightBackground: RscPicture {
				idc = 4;
                text = "pics\startlights_background.paa";
				x = 0.5 * safezoneW + safezoneX;
				y = 0.35 * safezoneH + safezoneY;
				w = 0.400445 * safezoneW;
				h = 0.139148 * safezoneH;
                colorBackground[]={0,0,0,1};
                colorText[]={1,1,1,0};
            };

            class startlight1: startlightDefault {
				idc = 5;
				y = 0.35 * safezoneH + safezoneY;
                colorText[]={1,1,0,0.7};
            };
            class startlight2: startlightDefault {
				idc = 6;
				y = 0.45 * safezoneH + safezoneY;
                colorText[]={1,1,0,0.7};
            };
            class startlight3: startlightDefault {
				idc = 7;
				y = 0.55 * safezoneH + safezoneY;
                colorText[]={0,1,0,0.7};
            };
            class startlight4: startlightDefault {
				idc = 8;
				y = 0.65 * safezoneH + safezoneY;
                colorText[]={0.5,0,0,0.7};
            };
        };
    };
};