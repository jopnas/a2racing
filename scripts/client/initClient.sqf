raceStarted = false;
racePaused = false;

rounds = 0;
raceTime = 0;
roundTime = 0;
raceTimeHuminized = "00:00:0000";
roundTimeHuminized = "00:00:0000";
raceTimeArray = "00:00:0000";
roundTimeArray = ["00","00","0000"];

chpoi1 = false;
chpoi2 = false;
chpoi3 = false;

roundtimes = [];

/*
	Function for finishline trigger.

	onAct.:
	[] call fnc_crossedFinishline;
*/
fnc_crossedFinishline = {
	if(!racePaused && raceStarted && chpoi1 && chpoi2 && chpoi3)then{
		// TODO: send roundtime to server

		serverExec = format["[%1,%2] call fnc_getBesttime",name player,roundTime];
		publicVariable "serverExec";

		roundtimes = roundtimes + [roundTimeHuminized];

		roundTime = 0;
		rounds = rounds + 1;
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
		roundTime = roundTime + 1;

		//raceTimeHuminized = format["%1:%2:%3"(raceTime*60)*60,raceTime*60,raceTime];
		roundTimeMili 	= roundTime;
		roundTimeSec 	= floor(roundTime/10);
		roundTimeMin 	= floor((roundTime/10)/60);
		
		raceTimeMili 	=raceTime;
		raceTimeSec 	= floor(raceTime/10);
		raceTimeMin 	= floor((raceTime/10)/60);

		if(roundTimeSec < 10)then{
			roundTimeSec = format["0%1",roundTimeSec];
		};

		if(roundTimeMin < 10)then{
			roundTimeMin = format["0%1",roundTimeMin];
		};

		if(raceTimeSec < 10)then{
			raceTimeSec = format["0%1",raceTimeSec];
		};

		if(raceTimeMin < 10)then{
			raceTimeMin = format["0%1",raceTimeMin];
		};

		raceTimeHuminized = format["%1:%2:%3",raceTimeMin,raceTimeSec,raceTimeMili];
		roundTimeHuminized = format["%1:%2:%3",roundTimeMin,roundTimeSec,roundTimeMili];
	};
	hintSilent format["raceStarted: %1\n racePaused: %2\n rounds: %3\n raceTimeHum.: %4\n roundTimeHum.: %5\n chpoi1: %6\n chpoi2: %7\n chpoi3: %8 \n\nRoundtimes\n\n%9",raceStarted,racePaused,rounds,raceTimeHuminized,roundTimeHuminized,chpoi1,chpoi2,chpoi3,roundtimes];
	sleep 0.1;
};
