disableSerialization;
4 cutRsc ["startSignal_gui","PLAIN",0];
_namespaceUI = uiNamespace getVariable "startsignal_display";

_ctrlLight1	= _namespaceUI displayCtrl 2;
_ctrlLight2	= _namespaceUI displayCtrl 3;
_ctrlLight3	= _namespaceUI displayCtrl 4;
_ctrlLight4	= _namespaceUI displayCtrl 5;

sleep 2;
systemChat "Start Race in 3";
playSound ["startsignalReady", false];
_ctrlLight1 ctrlSetText "a2racing\pics\capthat_transmitter_led_on.paa";

sleep 2;
systemChat "Start Race in 2";
playSound ["startsignalReady", false];
_ctrlLight2 ctrlSetText "a2racing\pics\capthat_transmitter_led_on.paa";

sleep 2;
systemChat "Start Race in 1";
playSound ["startsignalReady", false];
_ctrlLight3 ctrlSetText "a2racing\pics\capthat_transmitter_led_on.paa";

sleep 2;
systemChat "GO! GO! GO!";
playSound ["startsignalGo", false];
_ctrlLight4 ctrlSetText "a2racing\pics\capthat_transmitter_led_on.paa";

raceStarted = true;
racePaused = false;

if(serverCommandAvailable "#logout")then {
	publicVariable "raceStarted";
	publicVariable "racePaused";
};

4 cutFadeOut 2;

