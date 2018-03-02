raceStarted = false;
racePaused = false;
raceFinished = false;

if(serverCommandAvailable "#logout" || (getPlayerUID player) == "_SP_PLAYER_")then {
	publicVariable "raceStarted";
	publicVariable "racePaused";
	publicVariable "raceFinished";
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