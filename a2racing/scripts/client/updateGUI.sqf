disableSerialization;
_namespaceUI = uiNamespace getVariable "player_display";

_ctrlLapsCountText 	= _namespaceUI displayCtrl 6;
_ctrlRaceTimeText 	= _namespaceUI displayCtrl 7;
_ctrlLapTimeText 	= _namespaceUI displayCtrl 8;
_ctrlHighscoreText 	= _namespaceUI displayCtrl 9;

_ctrlLapsCountText ctrlSetText format["Laps: %1",laps];
_ctrlRaceTimeText ctrlSetText format["Racetime: %1",raceTimeHuminized];
_ctrlLapTimeText ctrlSetText format["Laptime: %1",lapTimeHuminized];

switch(count sortedLaptimes)do{
	case 1:{
		_uiLaptimes = (sortedLaptimes select 0) select 0;
	};
	case 2:{
		_uiLaptimes = composeText [(sortedLaptimes select 0) select 0, lineBreak, (sortedLaptimes select 1) select 0];
	};
	case 3:{
		_uiLaptimes = composeText [(sortedLaptimes select 0) select 0, lineBreak, (sortedLaptimes select 1) select 0, lineBreak, (sortedLaptimes select 2) select 0];
	};
	case 4:{
		_uiLaptimes = composeText [(sortedLaptimes select 0) select 0, lineBreak, (sortedLaptimes select 1) select 0, lineBreak, (sortedLaptimes select 2) select 0, lineBreak, (sortedLaptimes select 3) select 0];
	};
	case 5:{
		_uiLaptimes = composeText [(sortedLaptimes select 0) select 0, lineBreak, (sortedLaptimes select 1) select 0, lineBreak, (sortedLaptimes select 2) select 0, lineBreak, (sortedLaptimes select 3) select 0,	lineBreak, (sortedLaptimes select 4) select 0];
	};
	default {
		_uiLaptimes = "";
	};
};
_ctrlHighscoreText ctrlSetText format["%1",_uiLaptimes];