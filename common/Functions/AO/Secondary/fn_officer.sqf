params ["_AOMarker", "_faction"]; 


private _spawnedUnits = [];
private _veh = [_AOMarker,([_faction, "officer"] call IA_fnc_getUnits)] call IA_fnc_spawnUnit;
[[_veh]] remoteExec ["IA_fnc_addToAllCurators", 2];

[west, [format["%1-officer",_AOMark], format["%1-main",_AOMark]], ["Take Our High Ranking Officer", "Kill Officer"], (getPos _veh) ,1, 2, true, "kill"] call BIS_fnc_taskCreate;

waitUntil { sleep 5;  !alive _veh};

[format["%1-officer",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;

_spawnedUnits
