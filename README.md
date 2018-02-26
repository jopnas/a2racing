# a2racing
Singleplayer only at the moment. I'am already working on multiplayer version.

Usage: 
1. copy #include "a2racing\desc_race.hpp" to you Description.ext to iclude a2racing gui and sounds.

2. copy following code to your init.sqf.

if(!isDedicated)then{
    [] execVM "a2racing\scripts\client\initClient.sqf";
};

if(isServer)then{
    [] execVM "a2racing\scripts\server\initServer.sqf";
};

Required mods: 
- Lingor Island (http://www.armaholic.com/page.php?id=10792)
- Ferrari F2004 (http://www.armaholic.com/page.php?id=6409)
- CBA: Operation Arrowhead (http://www.armaholic.com/page.php?id=6231)

This mission is in development. I can't guarantee that everything works.
