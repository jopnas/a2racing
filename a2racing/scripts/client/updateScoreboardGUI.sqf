disableSerialization;
_namespaceUI = uiNamespace getVariable "scoreboard_display";
_ctrlScoreboardText	= _namespaceUI displayCtrl 11;

_scoreboardTimes = "";
if(count scoreboard > 0)then{
	for "_i" from 0 to (count scoreboard) do {
		_uiLaptimes = format["%1\n%2",_scoreboardTimes, (scoreboard select _i) select 0];
		if(_i == 2)exitWith{};
	};
};

_ctrlScoreboardText ctrlSetText format["%1",_scoreboardTimes];