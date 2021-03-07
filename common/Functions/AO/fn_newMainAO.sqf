private _AOMark = [] call IA_fnc_getMainAO;

[west, [format["%1-main",_AOMark]], [format["Capture %1", markerText _AOMark], format["Capture %1", markerText _AOMark]], (getMarkerPos _AOMark) ,1, 2, true, "attack"] call BIS_fnc_taskCreate;
private _faction = "OPF_F";
[_AOMark, createHashMapFromArray [["mainGroup", 5], ["Car", 3], ["turret", 2]], _faction] call IA_fnc_spawnAO;
[_AOMark, _faction] call SEC_fnc_officer;
_AOMark call IA_fnc_setupMainAOTrig;