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
	switch (_chpoiNo) do {
		case 1: {
			chpoi1 = true;
		};
		case 2: {
			chpoi2 = true;
		};
		case 3: {
			chpoi3 = true;
		};
		case 4: {
			chpoi4 = true;
		};
	};
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

while {alive player} do {
	if(!racePaused && raceStarted)then{
		raceTime = raceTime + 1;
		roundTime = roundTime + 1;
	};
	sleep 0.1;
};
