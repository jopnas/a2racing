raceStarted = false;
racePaused = false;

publicVariable "raceStarted";
publicVariable "racePaused";

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

		serverExec = format["[%1,%2] call fnc_getBesttime",name player,lapTimeHuminized];
		publicVariable "serverExec";

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
player addAction ["Start Race", "scripts\client\startRace.sqf"];
player addAction ["Pause Race", "scripts\client\pauseRace.sqf"];
player addAction ["! Reset Race", "scripts\client\resetRace.sqf"];

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

			if(raceTimeMili >= 1000)then{
				raceTimeMili	= 0;
				raceTimeSec		= raceTimeSec + 1;
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
			if(raceTimeHour < 10)then{
				raceTimeHour = format["0%1",raceTimeHour];
			};

			if(raceTimeSec < 10)then{
				raceTimeSec = format["0%1",raceTimeSec];
			};

			if(raceTimeMin < 10)then{
				raceTimeMin = format["0%1",raceTimeMin];
			};

			// Laptime
			lapTimeMili = lapTimeMili + 1;

			if(lapTimeMili >= 1000)then{
				lapTimeMili	= 0;
				lapTimeSec	= lapTimeSec + 1;
			};

			if(lapTimeSec >= 60)then{
				raceTimeSec	= 0;
				lapTimeMin	= lapTimeMin + 1;
			};

			if(lapTimeMin >= 60)then{
				lapTimeMin	= 0;
				lapTimeHour	= lapTimeHour + 1;
			};

			// Keep at two characters
			if(lapTimeHour < 10)then{
				lapTimeHour = format["0%1",lapTimeHour];
			};

			if(parseNumber(lapTimeMin) < 10)then{
				lapTimeMin = format["0%1",lapTimeMin];
			};

			if(parseNumber(lapTimeSec) < 10)then{
				lapTimeSec = format["0%1",lapTimeSec];
			};

			raceTimeHuminized = format["%1:%2:%3:%4",raceTimeHour,raceTimeMin,raceTimeSec,raceTimeMili];
			lapTimeHuminized = format["%1:%2:%3:%4",lapTimeHour,lapTimeMin,lapTimeSec,lapTimeMili];
		};

		//hintSilent format["raceStarted: %1",raceStarted];
		hintSilent format["raceStarted: %1\n racePaused: %2\n laps: %3\n raceTimeHum.: %4\n lapTimeHum.: %5\n chpoi1: %6\n chpoi2: %7\n chpoi3: %8\n lapTimes\n\n%9",raceStarted,racePaused,laps,raceTimeHuminized,lapTimeHuminized,chpoi1,chpoi2,chpoi3,lapTimes];
		sleep 0.001;
	};
};
