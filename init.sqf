if(!isDedicated)then{
	[] execVM "scripts\client\initClient.sqf";
};

if(isServer)then{
	[] execVM "scripts\server\initServer.sqf";
};