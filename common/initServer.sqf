[] call compile preprocessFileLineNumbers "config\basic.sqf";
ztowninit = 0;
Ztown = 0;
CompZone = 0;
takenTowns = [];

[] execVM "Server\z_townmgr.sqf";
["Initialize"] call BIS_fnc_dynamicGroups;
addMissionEventHandler ["HandleDisconnect",{deleteMarker format["%1",(_this select 2)]; deletevehicle (_this select 0)}];
waitUntil {ztowninit==1};
[[] call IA_fnc_getMainAO, createHashMapFromArray [["mainGroup", 5], ["Car", 3], ["turret", 2]]] call IA_fnc_spawnAO;
