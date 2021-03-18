[] call compile preprocessFileLineNumbers "config\basic.sqf";
if (("NEWGAME" call BIS_fnc_getParamValue) == 1) then {
	[] call IA_fnc_clearState;
};
ztowninit = 0;
Ztown = 0;
CompZone = 0;
takenTowns = profilenamespace getvariable ["IA_SAVEGAME", []];

[] execVM "Server\z_townmgr.sqf";
addMissionEventHandler ["HandleDisconnect",{deleteMarker format["%1",(_this select 2)]; deletevehicle (_this select 0)}];
waitUntil {ztowninit==1};
{
	_x setMarkerAlpha 0.5;
	_x setMarkerColor "colorGreen";
} forEach takenTowns;
["Initialize"] call BIS_fnc_dynamicGroups;
sleep 10;
[] spawn IA_fnc_newMainAO;
[] spawn IA_fnc_newSideAO;
