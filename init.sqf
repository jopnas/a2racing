if(!isDedicated)then{
	[] execVM "a2racing\scripts\client\initClient.sqf";
};

if(isServer)then{
	[] execVM "a2racing\scripts\server\initServer.sqf";
};