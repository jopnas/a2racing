disableSerialization;
_namespaceUI = uiNamespace getVariable "player_display";

_ctrlLapsCountText 	= _namespaceUI displayCtrl 1;
_ctrlRaceTimeText 	= _namespaceUI displayCtrl 2;
_ctrlLapTimeText 	= _namespaceUI displayCtrl 3;

_ctrlLapsCountText ctrlSetText format["%1",laps];
_ctrlRaceTimeText ctrlSetText format["%1",raceTimeHuminized];
_ctrlLapTimeText ctrlSetText format["%1",lapTimeHuminized];