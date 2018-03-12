// example: serverExec = {hint "Test"};
"serverExec" addPublicVariableEventHandler {
	_fnc = _this select 1;
	//_compiledFnc = compile format["%1",_fnc];
	call _fnc;
};

rankedList = [["racedriver1",54337,5],["Racedriver2",272337,4]];
while(true)do{
	if((rankedList select) select 2 >= maxLaps)then{
		//winner is (rankedList select) select 0
	};
	sleep 0.001;
};