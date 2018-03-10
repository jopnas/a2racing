sortedLaptimes = [];

laps = 0;
raceTimeMili = 0;
raceTimeSec = 0;
raceTimeMin = 0;
raceTimeHour = 0;
raceTimeHuminized = "00:00:00:000";

lapTimeMili = 0;
lapTimeSec = 0;
lapTimeMin = 0;
lapTimeHour = 0;
lapTimeHuminized = "00:00:00:000";

chpoi1 = false;
chpoi2 = false;
chpoi3 = false;

lapTimes = [];

// create and broadcast public scoreboard array
showScoreboard = false;
//scoreboard = [["Racedriver 1","07:52:36:487",75236487],["Racedriver 2","00:03:04:653",304653],["Racedriver 3","00:00:46:034",46034]];
scoreboard = [];
publicVariable "scoreboard";

sortedScoreboard = [];

/*
	Function for finishline trigger.

	onAct.:
	[] call fnc_crossedFinishline;
*/
fnc_crossedFinishline = {
	if(!racePaused && raceStarted && chpoi1 && chpoi2 && chpoi3)then{
		lapTimeNumber = parsenumber ([lapTimeHuminized, ':'] call CBA_fnc_replace);
		lapTimes set [count lapTimes, [lapTimeHuminized,lapTimeNumber]];

		if(count lapTimes > 1)then {
			sortedLaptimes = [lapTimes,1] call CBA_fnc_sortNestedArray;
		}else{
			sortedLaptimes = lapTimes;
		};

		//scoreboard = scoreboard + [name player, lapTimeHuminized, lapTimeNumber];
		scoreboard set [count scoreboard, [name player, lapTimeHuminized, lapTimeNumber]];
		publicVariable "scoreboard";

		if(count scoreboard > 1)then{
			sortedScoreboard = [scoreboard,2] call CBA_fnc_sortNestedArray;
		}else{
			sortedScoreboard = scoreboard;
		};

		lapTimeMili = 0;
		lapTimeSec = 0;
		lapTimeMin = 0;
		lapTimeHour = 0;
		lapTimeHuminized = "00:00:00:000";

		laps = laps + 1;
		chpoi1 = false;
		chpoi2 = false;
		chpoi3 = false;

		if(laps >= maxLaps)then{
			raceFinished = true;
			systemChat "race finished"; 
		};

		//systemChat "crossed finishline"; 
	};
};

/*
	Function for checkpoint trigger.

	onAct.:
	[1] call fnc_crossedCheckpoint;
*/
fnc_crossedCheckpoint = {
	_chpoiNo = _this select 0;
	_compiledFnc = compile format["chpoi%1 = true;",_chpoiNo];
	call _compiledFnc;

	//systemChat "crossed checkpoint"; 
};

//Actions if MP
player addAction ["Start Race", "a2racing\scripts\client\startRace.sqf",nil,6,false,false,"","(serverCommandAvailable '#logout') or isServer"];
player addAction ["Pause Race", "a2racing\scripts\client\pauseRace.sqf",nil,5,false,false,"","(serverCommandAvailable '#logout') or isServer"];
player addAction ["! Reset Race", "a2racing\scripts\client\resetRace.sqf",nil,4,false,false,"","(serverCommandAvailable '#logout') or isServer"];


// example: clientExec = {hint "Test"};
"clientExec" addPublicVariableEventHandler {
	_fnc = _this select 1;
	//_compiledFnc = compile format["%1",_fnc];
	call _fnc;
};


[] spawn {
	3 cutRsc ["player_gui","PLAIN",0];

	while {alive player} do {
		if(!racePaused && raceStarted)then{

			// Time
			// Racetime
			raceTimeMili = raceTimeMili + 1;

			if(raceTimeMili >= 1000)then{
				raceTimeMili = 0;
			};
			if(raceTimeMili % 100 == 0)then{
				raceTimeSec	= raceTimeSec + 1;
			};

			if(raceTimeSec >= 60)then{
				raceTimeSec	= 0;
				raceTimeMin	= raceTimeMin + 1;
			};

			if(raceTimeMin >= 60)then{
				raceTimeMin		= 0;
				raceTimeHour	= raceTimeHour + 1;
			};

			// Keep at two characters
			raceTimeMiliStr = str raceTimeMili;
			if(raceTimeMili < 10)then{
				raceTimeMiliStr	= format["00%1",lapTimeMili];
			};
			if(raceTimeMili < 100)then{
				raceTimeMiliStr	= format["0%1",lapTimeMili];
			};

			if(raceTimeHour < 10)then{
				raceTimeHourStr = format["0%1",raceTimeHour];
			}else{
				raceTimeHourStr = format["%1",raceTimeHour];
			};

			if(raceTimeSec < 10)then{
				raceTimeSecStr = format["0%1",raceTimeSec];
			}else{
				raceTimeSecStr = format["%1",raceTimeSec];
			};

			if(raceTimeMin < 10)then{
				raceTimeMinStr = format["0%1",raceTimeMin];
			}else{
				raceTimeMinStr = format["%1",raceTimeMin];
			};

			// Laptime
			lapTimeMili = lapTimeMili + 1;

			if(lapTimeMili >= 1000)then{
				lapTimeMili	= 0;
			};
			if(lapTimeMili % 100 == 0)then{
				lapTimeSec = lapTimeSec + 1;
			};	

			if(lapTimeSec >= 60)then{
				lapTimeSec	= 0;
				lapTimeMin	= lapTimeMin + 1;
			};

			if(lapTimeMin >= 60)then{
				lapTimeMin	= 0;
				lapTimeHour	= lapTimeHour + 1;
			};

			// Keep at two characters
			lapTimeMiliStr = str lapTimeMili;
			if(lapTimeMili < 10)then{
				lapTimeMiliStr	= format["00%1",lapTimeMili];
			};
			if(lapTimeMili < 100)then{
				lapTimeMiliStr	= format["0%1",lapTimeMili];
			};

			if(lapTimeHour < 10)then{
				lapTimeHourStr = format["0%1",lapTimeHour];
			}else{
				lapTimeHourStr = format["%1",lapTimeHour];
			};

			if(lapTimeMin < 10)then{
				lapTimeMinStr = format["0%1",lapTimeMin];
			}else{
				lapTimeMinStr = format["%1",lapTimeMin];
			};

			if(lapTimeSec < 10)then{
				lapTimeSecStr = format["0%1",lapTimeSec];
			}else{
				lapTimeSecStr = format["%1",lapTimeSec];
			};

			raceTimeHuminized = format["%1:%2:%3:%4",raceTimeHourStr,raceTimeMinStr,raceTimeSecStr,lapTimeMiliStr];
			lapTimeHuminized = format["%1:%2:%3:%4",lapTimeHourStr,lapTimeMinStr,lapTimeSecStr,lapTimeMiliStr];
		};

		[] execVM "a2racing\scripts\client\updateGUI.sqf";

		sleep 0.001;
	};
};
