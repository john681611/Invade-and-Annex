private _AOMark = [] call IA_fnc_getMainAO;

[west, [format["%1-main",_AOMark]], [format["Capture %1", markerText _AOMark], format["Capture %1", markerText _AOMark]], (getMarkerPos _AOMark) ,1, 2, true, "attack"] call BIS_fnc_taskCreate;

//TODO RandomFaction
private _faction = "OPF_F";

//TODO Generate more dynamic config;
private _forceConfig = [] call IA_fnc_getMainAOForceConfig;
//TODO SEE if as laggy on server
//[AOTable, _AOMark, 30, .95, true] spawn BT_fnc_createTable;
[_AOMark, _forceConfig, _faction] spawn IA_fnc_spawnForce;

[_AOMark, _faction] call (selectRandom [SEC_fnc_officer]);// TODO better select random (from SEC)
_AOMark call IA_fnc_setupMainAOTrig;
takenTowns pushBack _AOMark;
profilenamespace setvariable ["IA_SAVEGAME", takenTowns];