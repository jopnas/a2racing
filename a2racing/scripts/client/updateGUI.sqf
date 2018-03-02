disableSerialization;
private["_uiLaptimes"];
_namespaceUI = uiNamespace getVariable "player_display";

_ctrlLapsCountText 	= _namespaceUI displayCtrl 6;
_ctrlRaceTimeText 	= _namespaceUI displayCtrl 7;
_ctrlLapTimeText 	= _namespaceUI displayCtrl 8;
_ctrlHighscoreText 	= _namespaceUI displayCtrl 9;

_ctrlLapsCountText ctrlSetText format["Laps: %1",laps];
_ctrlRaceTimeText ctrlSetText format["Racetime: %1",raceTimeHuminized];
_ctrlLapTimeText ctrlSetText format["Laptime: %1",lapTimeHuminized];

for "_i" from 0 to (count sortedLaptimes) do {
	_uiLaptimes = format["%1<br />%2",_uiLaptimes, (sortedLaptimes select _i) select 0];
	if(_i == 2)exitWith{};
};

_ctrlHighscoreText ctrlSetStructuredText parseText _uiLaptimes;