// example: serverExec = {hint "Test"};
"serverExec" addPublicVariableEventHandler {
	_fnc = _this select 1;
	//_compiledFnc = compile format["%1",_fnc];
	call _fnc;
};