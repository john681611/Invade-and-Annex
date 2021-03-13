params ["_marker"];

_marker setMarkerColor "ColorBlue";
[west, _marker, markerText _marker] call BIS_fnc_addRespawnPosition;

["TaskSucceeded", ["",format ["%1 online!", markerText _marker]]] remoteExec ["BIS_fnc_showNotification", 2];