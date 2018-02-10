raceStarted = true;
racePaused = false;

rounds = 0;
raceTime = 0;
roundTime = 0;
raceTimeHuminized = "00:00:000";
roundTimeHuminized = "00:00:000";
raceTimeArray = "00:00:000";
roundTimeArray = ["00","00","000"];

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

//Admin Actions
	// TODO: pause on all clients
	// Adding Actions
/*player addAction["Start Race",{
	raceStarted = false;
},nil,1,false,false,"",""];

player addAction["Pause Race",{
	if(racePaused)then{
		racePaused = false;
	}else{
		racePaused = true;
	}
},[],1,false,false,"",""];

player addAction["Reset Race",{
	raceStarted = false;
	racePaused = false;

	rounds = 0;
	raceTime = 0;
	roundTime = 0;

	chpoi1 = false;
	chpoi2 = false;
	chpoi3 = false;
},[],1,false,false,"",""];

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
		roundTimeSec 	= floor(roundTime/60);
		roundTimeMin 	= floor((roundTime/60)/60);

		if(roundTimeSec < 10)then{
			roundTimeSec = format["0%1",roundTimeSec];
		};

		if(roundTimeMin < 10)then{
			roundTimeMin = format["0%1",roundTimeMin];
		};

		roundTimeHuminized = format["%1:%2:%3",roundTimeMin,roundTimeSec,roundTimeMili];
	};
	hintSilent format["raceStarted: %1\n racePaused: %2\n rounds: %3\n raceTimeHum.: %4\n roundTimeHum.: %5\n chpoi1: %6\n chpoi2: %7\n chpoi3: %8 \n\nRoundtimes\n\n%9",raceStarted,racePaused,rounds,raceTime,roundTimeHuminized,chpoi1,chpoi2,chpoi3,roundtimes];
	sleep 0.1;
};
