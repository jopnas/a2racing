# a2racing
Singleplayer only at the moment. Multiplayer NOT tested.

Required mods for scripts:
- CBA: Operation Arrowhead (http://www.armaholic.com/page.php?id=6231)

Required mods for mission example: 
- Lingor Island (http://www.armaholic.com/page.php?id=10792)
- Ferrari F2004 (http://www.armaholic.com/page.php?id=6409)

This mission is in development. I can't guarantee that everything works.

Usage: 
1.  copy #include "a2racing\desc_race.hpp" to you Description.ext to iclude a2racing gui and sounds.

2.  copy following code to your init.sqf.

    if(!isDedicated)then{
        [] execVM "a2racing\scripts\client\initClient.sqf";
    };

    if(isServer)then{
        [] execVM "a2racing\scripts\server\initServer.sqf";
    };

In mission you need 3 checkpoints trigger and 1 finsihline trigger, triggers by any and set to repeating.

Finishline onAct.:	[] call fnc_crossedFinishline;
Checkpoint onAct.:	[1] call fnc_crossedCheckpoint; 
fnc_crossedCheckpoint need checkpoint number in parameters
