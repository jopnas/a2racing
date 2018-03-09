// code by 'Hunter'
_pitPosition = markerpos "pitStop";
while {true} do {
	sleep 3;

	_vehicle = vehicle player;
	if ((_vehicle != player) && (player == (driver _vehicle))) then {
		if (((speed _vehicle) < 3) && ((_pitPosition distance _vehicle) < 5) && (fuel _vehicle < 1 || damage _vehicle > 0)) then {
			showScoreboard = true;
			_vehicle enableSimulation false;
			_vehiclePos = getPosATL _vehicle;
			_vehicle setPosATL [_vehiclePos select 0,_vehiclePos select 1,(_vehiclePos select 2) + 0.2];
			playSound ["pitstop", false];
			hintSilent "Supplying your vehicle. Don't move!";
			sleep 10;

			_vehicle enableSimulation true;

			if (((speed _vehicle) < 3) && ((_pitPosition distance _vehicle) < 5)) then {
				showScoreboard = false;
				_vehicle setFuel 1;
				_vehicle setDamage 0;
				hint "READY! GO..GO..GO";
			};
		};
	};	
};