// code by 'Hunter'
_pitPosition = markerpos "pitStop";
while {true} do {
	sleep 3;

	_vehicle = vehicle player;
	if ((_vehicle != player) && (player == (driver _vehicle))) then {
		if (((speed _vehicle) < 3) && ((_pitPosition distance _vehicle) < 5)) then {
			hintSilent "Supplying your vehicle. Don't move!";
			sleep 5;

			if (((speed _vehicle) < 3) && ((_pitPosition distance _vehicle) < 5)) then {
				_vehicle setFuel 1;
				_vehicle setDamage 0;
			} else {
				hint "You moved!";
			};
		};
	};
};
