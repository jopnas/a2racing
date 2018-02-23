disableSerialization;
_namespaceUI = uiNamespace getVariable "player_display";

_ctrlLapsCountText 	= _namespaceUI displayCtrl 1;
_ctrlRaceTimeText 	= _namespaceUI displayCtrl 2;
_ctrlLapTimeText 	= _namespaceUI displayCtrl 3;

_ctrlLapsCountText ctrlSetText format["Laps: %1",laps];
_ctrlRaceTimeText ctrlSetText format["Racetime: %1",raceTimeHuminized];
_ctrlLapTimeText ctrlSetText format["Laptime: %1",lapTimeHuminized];