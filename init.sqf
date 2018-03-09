// https://github.com/patroza/cba/tree/develop/addons
raceStarted = false;
racePaused = false;
raceFinished = false;
maxLaps = 5;

publicVariable "raceStarted";
publicVariable "racePaused";
publicVariable "raceFinished";

[] execVM "a2racing\scripts\globalFuncs.sqf";

if(!isDedicated)then{
	[] execVM "a2racing\scripts\client\initClient.sqf";
	[] execVM "a2racing\scripts\client\pitstop.sqf";
};

if(isServer)then{
	[] execVM "a2racing\scripts\server\initServer.sqf";
};