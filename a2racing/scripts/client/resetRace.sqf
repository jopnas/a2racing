raceStarted = false;
racePaused = false;
raceFinished = false;

lapCount = 0;
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

[-1, {raceStarted = _this select 0;racePaused = _this select 1;raceFinished = _this select 2;}, [raceStarted,racePaused,raceFinished]] call CBA_fnc_globalExecute;

