disableSerialization;
_namespaceUI = uiNamespace getVariable "player_display";

_ctrlLapCountText 	= _namespaceUI displayCtrl 6;
_ctrlRaceTimeText 	= _namespaceUI displayCtrl 7;
_ctrlLapTimeText 	= _namespaceUI displayCtrl 8;
_ctrlHighscoreText = _namespaceUI displayCtrl 9;
_ctrlScoreboardText	= _namespaceUI displayCtrl 10;

_ctrlLapCountText ctrlSetText format["Laps: %1",lapCount];
_ctrlRaceTimeText ctrlSetText format["Racetime: %1",raceTimeHuminized];
_ctrlLapTimeText ctrlSetText format["Laptime: %1",lapTimeHuminized];

// Players Bestlaps
_uiLaptimes = "";
if(count sortedLaptimes > 0)then{
	{
		_uiLaptimes = format["%1\n%2",_uiLaptimes, _x select 0];
		if(_forEachIndex == 2)exitWith{};
	} forEach sortedLaptimes;
};
_ctrlHighscoreText ctrlSetText format["%1",_uiLaptimes];

if(showScoreboard)then{
	// Race Bestlaps
	_ctrlScoreboardText ctrlSetTextColor [1,1,1,1];
	_ctrlScoreboardText ctrlSetBackgroundColor [0,0,0,1];

	_scoreboardTimes = "";
	if(count sortedScoreboard > 0)then{
		{
			_scoreboardTimes = format["%1\n%2. %3 %4",_scoreboardTimes, _forEachIndex + 1, _x select 1, _x select 0];
			if(_forEachIndex == 3)exitWith{};
		} forEach sortedScoreboard;
	};
	_ctrlScoreboardText ctrlSetText format["%1",_scoreboardTimes];
}else{
	_ctrlScoreboardText ctrlSetTextColor [1,1,1,0];
	_ctrlScoreboardText ctrlSetBackgroundColor [0,0,0,0];
};