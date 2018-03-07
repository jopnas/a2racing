disableSerialization;
_namespaceUI = uiNamespace getVariable "scoreboard_display";
_ctrlScoreboardText	= _namespaceUI displayCtrl 11;

_scoreboardTimes = "";
if(count scoreboard > 0)then{
	for "_i" from 0 to (count scoreboard) do {
		_uiLaptimes = format["%1\n%2. %3 %4",_scoreboardTimes, _i + 1, (scoreboard select _i) select 1, (scoreboard select _i) select 0];
		if(_i == 5)exitWith{};
	};
};

_ctrlScoreboardText ctrlSetText format["%1",_scoreboardTimes];