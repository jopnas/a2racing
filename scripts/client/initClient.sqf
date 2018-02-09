waitUntil{!(isNil "BIS_MPF_InitDone")};

raceStarted = false;
racePaused = false;

rounds = 0;
raceTime = 0;
roundTime = 0;

chpoi1 = false;
chpoi2 = false;
chpoi3 = false;
chpoi4 = false;

/*
	Function for finishline trigger.

	onAct.:
	[] call fnc_crossedFinishline;	
*/
fnc_crossedFinishline = {
	if(!racePaused && raceStarted && chpoi1 && chpoi2 && chpoi3 && chpoi4)then{
		// TODO: send roundtime to server

		serverExec = format["[%1,%2] call fnc_getBesttime",name player,roundTime];
		publicVariable "serverExec";

		roundTime = 0;
		rounds = rounds + 1;
		chpoi1 = false;
		chpoi2 = false;
		chpoi3 = false;
		chpoi4 = false;
	};
};

/*
	Function for checkpoint trigger.

	onAct.:
	[1] call fnc_crossedCheckpoint;
	[2] call fnc_crossedCheckpoint;
	[3] call fnc_crossedCheckpoint;
	[4] call fnc_crossedCheckpoint;
*/
fnc_crossedCheckpoint = {
	_chpoiNo = _this select 0;
	_compiledFnc = compile format["chpoi%1 = true;",_chpoiNo];
	call _compiledFnc;
};

//Admin Actions
	// TODO: pause on all clients
player addAction["Pause Race",{
	if(racePaused)then{
		racePaused = false;
	}else{
		racePaused = true;
	}
},[],1,false,false,"","serverCommandAvailable '#kick'"];

// Player EventHandlers
"clientExec" addPublicVariableEventHandler {
	_fnc = _this select 1;
	_compiledFnc = compile format["%1",_fnc];
	call _compiledFnc;
};

/*"bestlist" addPublicVariableEventHandler {
	_best = _this select 1;
};*/

while {alive player} do {
	if(!racePaused && raceStarted)then{
		raceTime = raceTime + 1;
		roundTime = roundTime + 1;
	};
	sleep 0.1;
};
