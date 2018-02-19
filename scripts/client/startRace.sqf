systemChat "Start Race";
raceStarted = true;
racePaused = false;

if(serverCommandAvailable "#logout")then {
	publicVariable "raceStarted";
	publicVariable "racePaused";
};
