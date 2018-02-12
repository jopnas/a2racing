raceStarted = false;
racePaused = false;

laps = 0;
raceTime = 0;
lapTime = 0;
raceTimeHuminized = "00:00:0000";
lapTimeHuminized = "00:00:0000";
raceTimeArray = "00:00:0000";
lapTimeArray = ["00","00","0000"];

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

		serverExec = format["[%1,%2] call fnc_getBesttime",name player,lapTime];
		publicVariable "serverExec";

		lapTimes = lapTimes + [lapTimeHuminized];

		lapTime = 0;
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

while {alive player} do {
	if(!racePaused && raceStarted)then{
		raceTime = raceTime + 1;
		lapTime = lapTime + 1;

		//raceTimeHuminized = format["%1:%2:%3"(raceTime*60)*60,raceTime*60,raceTime];
		lapTimeMili 	= lapTime;
		lapTimeSec 	= floor(lapTime/10);
		lapTimeMin 	= floor((lapTime/10)/60);
		
		raceTimeMili 	=raceTime;
		raceTimeSec 	= floor(raceTime/10);
		raceTimeMin 	= floor((raceTime/10)/60);

		if(lapTimeSec < 10)then{
			lapTimeSec = format["0%1",lapTimeSec];
		};

		if(lapTimeMin < 10)then{
			lapTimeMin = format["0%1",lapTimeMin];
		};

		if(raceTimeSec < 10)then{
			raceTimeSec = format["0%1",raceTimeSec];
		};

		if(raceTimeMin < 10)then{
			raceTimeMin = format["0%1",raceTimeMin];
		};

		raceTimeHuminized = format["%1:%2:%3",raceTimeMin,raceTimeSec,raceTimeMili];
		lapTimeHuminized = format["%1:%2:%3",lapTimeMin,lapTimeSec,lapTimeMili];
	};
	hintSilent format["raceStarted: %1\n racePaused: %2\n laps: %3\n raceTimeHum.: %4\n lapTimeHum.: %5\n chpoi1: %6\n chpoi2: %7\n chpoi3: %8 \n\nlapTimes\n\n%9",raceStarted,racePaused,laps,raceTimeHuminized,lapTimeHuminized,chpoi1,chpoi2,chpoi3,lapTimes];
	sleep 0.1;
};
