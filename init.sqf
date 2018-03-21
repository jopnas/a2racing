// https://github.com/patroza/cba/tree/develop/addons
raceStarted = false;
racePaused = false;
raceFinished = false;
maxLaps = 3;

//https://github.com/patroza/cba/blob/develop/addons/network/fnc_globalExecute.sqf

missionNamespace setVariable ["serverExec", ""];
publicVariable "serverExec";

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