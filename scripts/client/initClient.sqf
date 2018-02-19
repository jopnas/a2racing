raceStarted = false;
racePaused = false;

if(serverCommandAvailable "#logout" || (getPlayerUID player) == "_SP_PLAYER_")then {
	publicVariable "raceStarted";
	publicVariable "racePaused";
};

laps = 0;
raceTimeMili = 0;
raceTimeSec = 0;
raceTimeMin = 0;
raceTimeHour = 0;
raceTimeHuminized = "00:00:00:0000";

lapTimeMili = 0;
lapTimeSec = 0;
lapTimeMin = 0;
lapTimeHour = 0;
lapTimeHuminized = "00:00:00:0000";

chpoi1 = false;
chpoi2 = false;
chpoi3 = false;

lapTimes = [];

/*
	Function for finishline trigger.

	onAct.:
	[] call fnc_crossedFinishline;
*/
fnc_crossedFinishline = {
	if(!racePaused && raceStarted && chpoi1 && chpoi2 && chpoi3)then{
		// TODO: send lapTime to server
		//serverExec = format["[%1,%2] call fnc_getBesttime",name player,lapTimeHuminized];
		//publicVariable "serverExec";

		lapTimes = lapTimes + [lapTimeHuminized];

		lapTimeMili = 0;
		lapTimeSec = 0;
		lapTimeMin = 0;
		lapTimeHour = 0;
		lapTimeHuminized = "00:00:00:0000";

		laps = laps + 1;
		chpoi1 = false;
		chpoi2 = false;
		chpoi3 = false;

		systemChat "crossed finishline"; 
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

	systemChat "crossed checkpoint"; 
};

//Actions
player addAction ["Start Race", "scripts\client\startRace.sqf",nil,6,false,false,"","(serverCommandAvailable '#logout') || ((getPlayerUID _target) == '_SP_PLAYER_')"];
player addAction ["Pause Race", "scripts\client\pauseRace.sqf",nil,5,false,false,"","(serverCommandAvailable '#logout') || ((getPlayerUID _target) == '_SP_PLAYER_')"];
player addAction ["! Reset Race", "scripts\client\resetRace.sqf",nil,4,false,false,"","(serverCommandAvailable '#logout') || ((getPlayerUID _target) == '_SP_PLAYER_')"];

/*
// Player EventHandlers
"clientExec" addPublicVariableEventHandler {
	_fnc = _this select 1;
	_compiledFnc = compile format["%1",_fnc];
	call _compiledFnc;
};*/

/*"bestlist" addPublicVariableEventHandler {
	_best = _this select 1;
};*/

[] spawn {
	while {alive player} do {
		if(!racePaused && raceStarted)then{

			// Time
			// Racetime
			raceTimeMili = raceTimeMili + 1;

			if(raceTimeMili > 1000)then{
				raceTimeMili = 0;
			};
			if(raceTimeMili % 100 == 0)then{
				raceTimeSec	= raceTimeSec + 1;
			};

			if(raceTimeSec > 60)then{
				raceTimeSec	= 0;
				raceTimeMin	= raceTimeMin + 1;
			};

			if(raceTimeMin > 60)then{
				raceTimeMin		= 0;
				raceTimeHour	= raceTimeHour + 1;
			};

			// Keep at two characters
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

			if(lapTimeMili > 1000)then{
				lapTimeMili	= 0;
			};
			if(lapTimeMili % 100 == 0)then{
				lapTimeSec = lapTimeSec + 1;
			};	

			if(lapTimeSec > 60)then{
				lapTimeSec	= 0;
				lapTimeMin	= lapTimeMin + 1;
			};

			if(lapTimeMin > 60)then{
				lapTimeMin	= 0;
				lapTimeHour	= lapTimeHour + 1;
			};

			// Keep at two characters
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

			raceTimeHuminized = format["%1:%2:%3:%4",raceTimeHourStr,raceTimeMinStr,raceTimeSecStr,raceTimeMili];
			lapTimeHuminized = format["%1:%2:%3:%4",lapTimeHourStr,lapTimeMinStr,lapTimeSecStr,lapTimeMili];
		};

		//hintSilent format["raceStarted: %1",raceStarted];
		hintSilent format["raceStarted: %1\n racePaused: %2\n laps: %3\n raceTimeHum.: %4\n lapTimeHum.: %5\n chpoi1: %6\n chpoi2: %7\n chpoi3: %8\n lapTimes\n\n%9",raceStarted,racePaused,laps,raceTimeHuminized,lapTimeHuminized,chpoi1,chpoi2,chpoi3,lapTimes];
		sleep 0.001;
	};
};
