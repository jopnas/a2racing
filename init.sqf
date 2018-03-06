// https://github.com/patroza/cba/tree/develop/addons
raceStarted = false;
racePaused = false;
raceFinished = false;
maxLaps = 5;

highscore = [["NotSure","07:52:36:487",75236487],["NotSure","00:03:04:653",304653]];
highscore = [highscore,2] call CBA_fnc_sortNestedArray;
systemchat str highscore;

publicVariable "raceStarted";
publicVariable "racePaused";
publicVariable "raceFinished";
publicVariable "highscore";

[] execVM "a2racing\scripts\globalFuncs.sqf";

if(!isDedicated)then{
	[] execVM "a2racing\scripts\client\initClient.sqf";
	[] execVM "a2racing\scripts\client\pitstop.sqf";
};

if(isServer)then{
	[] execVM "a2racing\scripts\server\initServer.sqf";
};