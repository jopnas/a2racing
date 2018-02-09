if(!isDedicated)then{
	[] execVM "scripts\client\initClient.sqf";
};

if(isServer)then{
	[] execVM "scripts\client\initServer.sqf";
};