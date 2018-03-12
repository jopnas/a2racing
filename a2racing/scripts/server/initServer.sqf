// example: serverExec = {hint "Test"};
"serverExec" addPublicVariableEventHandler {
	_fnc = _this select 1;
	_compiledFnc = compile format["%1",_fnc];
	call _fnc;
	systemChat "serverExec";
};

// rankedList = [["racedriver1",5],["Racedriver2",4]];
rankedList = [];
fnc_srv_lapsCheck = {
	_drivername = _this select 0;
	_driverlaps = _this select 1;

	rankedList set [count rankedList, [_drivername, _driverlaps]];

	rankedList = [rankedList,1] call CBA_fnc_sortNestedArray;

	if((rankedList select 0) select 1 >= maxLaps && !raceFinished)then{
		systemChat format["winner is %1",(rankedList select 0) select 0];
		
		raceFinished = true;
		publicVariable "raceFinished";
	};

	systemChat str rankedList;
};