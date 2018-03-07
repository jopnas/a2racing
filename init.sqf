// https://github.com/patroza/cba/tree/develop/addons
raceStarted = false;
racePaused = false;
raceFinished = false;
maxLaps = 5;

scoreboard = [["Racedriver 1","07:52:36:487",75236487],["Racedriver 2","00:03:04:653",304653],["Racedriver 3","00:00:46:034",46034]];
scoreboard = [scoreboard,2] call CBA_fnc_sortNestedArray;

publicVariable "raceStarted";
publicVariable "racePaused";
publicVariable "raceFinished";
publicVariable "scoreboard";

[] execVM "a2racing\scripts\globalFuncs.sqf";

if(!isDedicated)then{
	[] execVM "a2racing\scripts\client\initClient.sqf";
	[] execVM "a2racing\scripts\client\pitstop.sqf";
};

if(isServer)then{
	[] execVM "a2racing\scripts\server\initServer.sqf";
};