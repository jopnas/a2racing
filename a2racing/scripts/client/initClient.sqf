raceStarted = false;
racePaused = false;

if(serverCommandAvailable "#logout")then {
	publicVariable "raceStarted";
	publicVariable "racePaused";
};

sortedLaptimes = [];

laps = 0;
raceTimeMili = 0;
raceTimeSec = 0;
raceTimeMin = 0;
raceTimeHour = 0;
raceTimeHuminized = "00:00:00:0000";

lapTimeMili = 0;
lapTimeSec = 0;
lapTimeMin = 0;
lapTimeHour = 0;
lapTimeHuminized = "00:00:00:0000";

chpoi1 = false;
chpoi2 = false;
chpoi3 = false;

lapTimes = [];

fnc_sortArray = {
	/*
	Author:
	rübe

	Description:
	generic shell sort implementation. The original list does 
	NOT get altered.

	Shellsort is not sensitive to the initial ordering of the
	given list. Hard to compare to other sorting methods but
	shellsort is often the method of choice for many sorting
	applications:

		- acceptable runtime even for moderately large lists,
		(Sedgewick says up to "five thousand elements")
		- yet very easy algorithm.

	Parameter(s):
	_this select 0: the list to be sorted (array of any)
	_this select 1: sort value selector/calculator (string or code; optional)
					- gets passed a list item, must return scalar
					- if a string gets passed, we compile it first

					-> if the list does not consist of numbers but a complex 
						data structure (like arrays), you may pass a simple
						function, that accesses (or calculates) the "value" 
						in this structure the list will be sorted on.

					-> to simply invert the sort order, pass {_this * -1} as
						second parameter (for numbers).

						default sorting order is ASCENDING

	Returns:
	sorted list
	*/

	private ["_list", "_selectSortValue", "_n", "_cols", "_j", "_k", "_h", "_t"];

	_list = +(_this select 0);
	_selectSortValue = { _this };

	if ((count _this) > 1) then
	{
	if ((typeName (_this select 1)) == "CODE") then
	{
		_selectSortValue = _this select 1;
	} else {
		_selectSortValue = compile (_this select 1);
	};
	};

	// shell sort
	_n = count _list;
	// we take the increment sequence (3 * h + 1), which has been shown
	// empirically to do well... 
	_cols = [3501671, 1355339, 543749, 213331, 84801, 27901, 11969, 4711, 1968, 815, 271, 111, 41, 13, 4, 1];

	for "_k" from 0 to ((count _cols) - 1) do
	{
	_h = _cols select _k;
	for [{_i = _h}, {_i < _n}, {_i = _i + 1}] do
	{
		_t = _list select _i;
		_j = _i;

		while {(_j >= _h)} do
		{
			if (!(((_list select (_j - _h)) call _selectSortValue) > 
				(_t call _selectSortValue))) exitWith {};
			_list set [_j, (_list select (_j - _h))];
			_j = _j - _h;
		};


		_list set [_j, _t];
	};
	};

	_list
};

/*
	Function for finishline trigger.

	onAct.:
	[] call fnc_crossedFinishline;
*/
fnc_crossedFinishline = {
	if(!racePaused && raceStarted && chpoi1 && chpoi2 && chpoi3)then{
		// TODO: send lapTime to server
		//serverExec = format["[%1,%2] call fnc_getBesttime",name player,lapTimeHuminized];
		//publicVariable "serverExec";

		// parseNumber ([lapTimeHuminized, ':'] call CBA_fnc_replace)
		//lapTimes set [count lapTimes, [lapTimeHuminized,parseNumber ([lapTimeHuminized, ':'] call CBA_fnc_replace)]];
		
		lapTimeNumber = [lapTimeHuminized,":",""] execVM "a2racing\scripts\stringReplace.sqf";
		lapTimes set [count lapTimes, [lapTimeHuminized,lapTimeNumber]];

		if(count lapTimes > 1)then {
			// BIS_fnc_sortNum
			sortedLaptimes = [lapTimes,{(_x select 1)}] call fnc_sortArray;
		}else{
			sortedLaptimes = lapTimes;
		};

		lapTimeMili = 0;
		lapTimeSec = 0;
		lapTimeMin = 0;
		lapTimeHour = 0;
		lapTimeHuminized = "00:00:00:0000";

		laps = laps + 1;
		chpoi1 = false;
		chpoi2 = false;
		chpoi3 = false;

		//systemChat "crossed finishline"; 
	};
};

/*
	Function for checkpoint trigger.

	onAct.:
	[1] call fnc_crossedCheckpoint;
*/
fnc_crossedCheckpoint = {
	_chpoiNo = _this select 0;
	_compiledFnc = compile format["chpoi%1 = true;",_chpoiNo];
	call _compiledFnc;

	//systemChat "crossed checkpoint"; 
};

//Actions if MP
player addAction ["Start Race", "a2racing\scripts\client\startRace.sqf",nil,6,false,false,"","(serverCommandAvailable '#logout') or isServer"];
player addAction ["Pause Race", "a2racing\scripts\client\pauseRace.sqf",nil,5,false,false,"","(serverCommandAvailable '#logout') or isServer"];
player addAction ["! Reset Race", "a2racing\scripts\client\resetRace.sqf",nil,4,false,false,"","(serverCommandAvailable '#logout') or isServer"];

/*
// Player EventHandlers
"clientExec" addPublicVariableEventHandler {
	_fnc = _this select 1;
	_compiledFnc = compile format["%1",_fnc];
	call _compiledFnc;
};*/

/*"bestlist" addPublicVariableEventHandler {
	_best = _this select 1;
};*/

[] spawn {
	3 cutRsc ["player_gui","PLAIN",0];

	while {alive player} do {
		if(!racePaused && raceStarted)then{

			// Time
			// Racetime
			raceTimeMili = raceTimeMili + 1;

			if(raceTimeMili >= 1000)then{
				raceTimeMili = 0;
			};
			if(raceTimeMili % 100 == 0)then{
				raceTimeSec	= raceTimeSec + 1;
			};

			if(raceTimeSec >= 60)then{
				raceTimeSec	= 0;
				raceTimeMin	= raceTimeMin + 1;
			};

			if(raceTimeMin >= 60)then{
				raceTimeMin		= 0;
				raceTimeHour	= raceTimeHour + 1;
			};

			// Keep at two characters
			if(raceTimeHour < 10)then{
				raceTimeHourStr = format["0%1",raceTimeHour];
			}else{
				raceTimeHourStr = format["%1",raceTimeHour];
			};

			if(raceTimeSec < 10)then{
				raceTimeSecStr = format["0%1",raceTimeSec];
			}else{
				raceTimeSecStr = format["%1",raceTimeSec];
			};

			if(raceTimeMin < 10)then{
				raceTimeMinStr = format["0%1",raceTimeMin];
			}else{
				raceTimeMinStr = format["%1",raceTimeMin];
			};

			// Laptime
			lapTimeMili = lapTimeMili + 1;

			if(lapTimeMili >= 1000)then{
				lapTimeMili	= 0;
			};
			if(lapTimeMili % 100 == 0)then{
				lapTimeSec = lapTimeSec + 1;
			};	

			if(lapTimeSec >= 60)then{
				lapTimeSec	= 0;
				lapTimeMin	= lapTimeMin + 1;
			};

			if(lapTimeMin >= 60)then{
				lapTimeMin	= 0;
				lapTimeHour	= lapTimeHour + 1;
			};

			// Keep at two characters
			if(lapTimeHour < 10)then{
				lapTimeHourStr = format["0%1",lapTimeHour];
			}else{
				lapTimeHourStr = format["%1",lapTimeHour];
			};

			if(lapTimeMin < 10)then{
				lapTimeMinStr = format["0%1",lapTimeMin];
			}else{
				lapTimeMinStr = format["%1",lapTimeMin];
			};

			if(lapTimeSec < 10)then{
				lapTimeSecStr = format["0%1",lapTimeSec];
			}else{
				lapTimeSecStr = format["%1",lapTimeSec];
			};

			raceTimeHuminized = format["%1:%2:%3:%4",raceTimeHourStr,raceTimeMinStr,raceTimeSecStr,raceTimeMili];
			lapTimeHuminized = format["%1:%2:%3:%4",lapTimeHourStr,lapTimeMinStr,lapTimeSecStr,lapTimeMili];
		};

		[] execVM "a2racing\scripts\client\updateGUI.sqf";
		

		//hintSilent format["raceStarted: %1\n racePaused: %2\n chpoi1: %3\n chpoi2: %4\n chpoi3: %5\n",raceStarted,racePaused,chpoi1,chpoi2,chpoi3];
		sleep 0.001;
	};
};
