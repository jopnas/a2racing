disableSerialization;
_namespaceUI = uiNamespace getVariable "player_display";

_ctrlLapsCountText 	= _namespaceUI displayCtrl 6;
_ctrlRaceTimeText 	= _namespaceUI displayCtrl 7;
_ctrlLapTimeText 	= _namespaceUI displayCtrl 8;
_ctrlHighscoreText 	= _namespaceUI displayCtrl 9;

_ctrlLapsCountText ctrlSetText format["Laps: %1",laps];
_ctrlRaceTimeText ctrlSetText format["Racetime: %1",raceTimeHuminized];
_ctrlLapTimeText ctrlSetText format["Laptime: %1",lapTimeHuminized];

systemChat str sortedLaptimes;
_uiLaptimes = "";
if(count sortedLaptimes > 0)then{
	for "_i" from 0 to (count sortedLaptimes) do {
		_uiLaptimes = format["%1\n%2",_uiLaptimes, (sortedLaptimes select _i) select 0];
		if(_i == 2)exitWith{};
	};
};

_ctrlHighscoreText ctrlSetText format["%1",_uiLaptimes];//_uiLaptimes;