// rankedList = [["racedriver1",5],["Racedriver2",4]];
fnc_srv_lapsCheck = {
	_drivername = _this select 0;
	_driverlaps = _this select 1;

	if(_driverlaps == maxLaps)then{
		playersFinished set [count playersFinished, _drivername];
		[-1, {[_this] call fnc_playerFinishedCheck;},playersFinished] call CBA_fnc_globalExecute;
	};
};