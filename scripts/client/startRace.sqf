disableSerialization;
cutRsc ["startSignal_gui", "PLAIN", 1, false];
_namespaceUI = uiNamespace getVariable "player_display";

_ctrlLight1	= _namespaceUI displayCtrl 2;
_ctrlLight2	= _namespaceUI displayCtrl 3;
_ctrlLight3	= _namespaceUI displayCtrl 4;
_ctrlLight4	= _namespaceUI displayCtrl 5;

sleep 3;
systemChat "Start Race in 3";
playSound ["startsignalReady", false];
_ctrlLight1 ctrlSetText "pics\capthat_transmitter_led_on.paa";

sleep 3;
systemChat "Start Race in 2";
playSound ["startsignalReady", false];
_ctrlLight2 ctrlSetText "pics\capthat_transmitter_led_on.paa";

sleep 3;
systemChat "Start Race in 1";
playSound ["startsignalReady", false];
_ctrlLight3 ctrlSetText "pics\capthat_transmitter_led_on.paa";

sleep 3;
systemChat "GO! GO! GO!";
playSound ["startsignalGo", false];
_ctrlLight4 ctrlSetText "pics\capthat_transmitter_led_on.paa";

raceStarted = true;
racePaused = false;

if(serverCommandAvailable "#logout")then {
	publicVariable "raceStarted";
	publicVariable "racePaused";
};
