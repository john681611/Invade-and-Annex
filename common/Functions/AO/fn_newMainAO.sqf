private _AOMark = [] call IA_fnc_getMainAO;

[west, [format["%1-main",_AOMark]], [format["Capture %1", markerText _AOMark], format["Capture %1", markerText _AOMark]], (getMarkerPos _AOMark) ,1, 2, true, "attack"] call BIS_fnc_taskCreate;

//TODO RandomFaction
private _faction = "OPF_F";

//TODO Generate more dynamic config;
private _forceConfig = createHashMapFromArray [["mainGroup", 5], ["Car", 3], ["turret", 2]];
//TODO SEE if as laggy on server
//[AOTable, _AOMark, 30, .95, true] spawn BT_fnc_createTable;
[_AOMark, _forceConfig, _faction] spawn IA_fnc_spawnForce;
[_AOMark, _faction] call SEC_fnc_officer;// TODO Select random
_AOMark call IA_fnc_setupMainAOTrig;
takenTowns pushBack _AOMark;
//TODO save takenTowns