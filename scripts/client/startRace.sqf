systemChat "Start Race";
raceStarted = true;
racePaused = false;

if(serverCommandAvailable "#logout" || (getPlayerUID player) == "_SP_PLAYER_")then {
	publicVariable "raceStarted";
	publicVariable "racePaused";
};
