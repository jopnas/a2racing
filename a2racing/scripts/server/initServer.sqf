raceStarted = false;
racePaused = false;

publicVariable "raceStarted";
publicVariable "racePaused";

/*bestlist = [["NotSure","3046535"],["NotSure","782364876"]];
publicVariable "bestlist";

fnc_sendBestlistClient = {
	_fnc = _this select 0;
	clientExec = _fnc;
	publicVariable "clientExec";
};

fnc_getBesttime = {
	_playerName = _this select 0;
	_lapTime 	= _this select 1;
	bestlist	= bestlist + [_playerName,lapTime];
	publicVariable "bestlist";
};

"serverExec" addPublicVariableEventHandler {
	_fnc = _this select 1;
	_compiledFnc = compile format["%1",_fnc];
	call _compiledFnc;
};*/