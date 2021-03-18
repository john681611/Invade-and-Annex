params ["_marker"];
private _fobs = profilenamespace getvariable ["IA_SAVEGAME_FOB", []];
_fobs pushBack _marker;
profilenamespace setvariable ["IA_SAVEGAME_FOB", _fobs];
_marker setMarkerColor "colorBLUFOR";
[west, _marker, markerText _marker] call BIS_fnc_addRespawnPosition;

["TaskSucceeded", ["",format ["%1 online!", markerText _marker]]] remoteExec ["BIS_fnc_showNotification", 2];