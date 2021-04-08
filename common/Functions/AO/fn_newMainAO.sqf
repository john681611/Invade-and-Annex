params [["_survivors", []]];
private _AOMark = [] call IA_fnc_getMainAO;
[west, [format["%1-main",_AOMark]], [format["Capture %1", markerText _AOMark], format["Capture %1", markerText _AOMark]], (getMarkerPos _AOMark) ,1, 2, true, "attack"] call BIS_fnc_taskCreate;

private _faction = selectRandom factions;
private _forceConfig = [] call IA_fnc_getMainAOForceConfig;
private _spawnedUnits = [_AOMark, _forceConfig, _faction] call IA_fnc_spawnForce;

_survivors = [_survivors, _AOMark] call IA_fnc_retreatToNextAO;
_spawnedUnits = _spawnedUnits + ([_AOMark, _faction] call (selectRandom sideMissions));
_survivors = _survivors + (_spawnedUnits select {side _x == east});
[_AOMark, _survivors] call IA_fnc_setupMainAOTrig;

takenTowns pushBack _AOMark;
profilenamespace setvariable ["IA_SAVEGAME", takenTowns];