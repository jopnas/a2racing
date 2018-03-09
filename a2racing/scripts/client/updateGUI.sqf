disableSerialization;
_namespaceUI = uiNamespace getVariable "player_display";

_ctrlLapsCountText 	= _namespaceUI displayCtrl 6;
_ctrlRaceTimeText 	= _namespaceUI displayCtrl 7;
_ctrlLapTimeText 	= _namespaceUI displayCtrl 8;
_ctrlHighscoreText 	= _namespaceUI displayCtrl 9;
_ctrlScoreboardText	= _namespaceUI displayCtrl 10;

_ctrlLapsCountText ctrlSetText format["Laps: %1",laps];
_ctrlRaceTimeText ctrlSetText format["Racetime: %1",raceTimeHuminized];
_ctrlLapTimeText ctrlSetText format["Laptime: %1",lapTimeHuminized];

// Players Bestlaps
_uiLaptimes = "";
if(count sortedLaptimes > 0)then{
	for "_i" from 0 to (count sortedLaptimes) do {
		_uiLaptimes = format["%1\n%2",_uiLaptimes, (sortedLaptimes select _i) select 0];
		if(_i == 2)exitWith{};
	};
};
_ctrlHighscoreText ctrlSetText format["%1",_uiLaptimes];

if(showScoreboard)then{
	// Race Bestlaps
	_ctrlScoreboardText ctrlSetFade 1;
	_ctrlScoreboardText ctrlCommit 1;

	_scoreboardTimes = "";
	if(count scoreboard > 0)then{
		for "_i" from 0 to (count scoreboard) do {
			_scoreboardTimes = format["%1\n%2. %3 %4",_scoreboardTimes, _i + 1, (scoreboard select _i) select 1, (scoreboard select _i) select 0];
			if(_i == 5)exitWith{};
		};
	};
	_ctrlScoreboardText ctrlSetText format["%1",_scoreboardTimes];
}else{
	_ctrlScoreboardText ctrlSetFade 0;
	_ctrlScoreboardText ctrlCommit 1;
};