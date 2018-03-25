_target = _this select 0; //Object - the object which the action is assigned to
_caller = _this select 1; //Object - the unit that activated the action
_ID = _this select 2; // Number - ID of the activated action (same as ID returned by addAction)
_arguments = _this select 3; //Anything - arguments given to the script if you are using the extended syntax

if(racePaused)then {
	racePaused = false;
	_caller removeAction _ID;
	_caller  addAction ["Pause Race", "a2racing\scripts\client\pauseRace.sqf",nil,5,false,false,"","(serverCommandAvailable '#logout') or isServer"];
} else {
	racePaused = true;
	_caller removeAction _ID;
	_caller  addAction ["Continou Race", "a2racing\scripts\client\pauseRace.sqf",nil,5,false,false,"","((serverCommandAvailable '#logout') or isServer)"];
};

publicVariable "racePaused";
[-1, {racePaused = _this;},racePaused] call CBA_fnc_globalExecute;

