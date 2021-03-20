params ["_AOMarker", "_faction"]; 


private _spawnedUnits = [];
private _veh = [_AOMarker,([_faction, "officer"] call IA_fnc_getUnits)] call IA_fnc_spawnUnit;
[[_veh]] remoteExec ["IA_fnc_addToAllCurators", 2];

private _forceConfig = createHashMapFromArray [["mainGroup", 2], ["Car", 2], ["turret", 1]];
[_AOMark, _forceConfig, _faction] call IA_fnc_spawnForce;

[west, [format["%1-officer",_AOMark], format["%1-main",_AOMark]], ["Take Our High Ranking Officer", "Side: Kill Officer"], (getPos _veh) ,1, 2, true, "kill"] call BIS_fnc_taskCreate;

waitUntil { sleep 5;  !alive _veh};

[format["%1-officer",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;

deleteMarker _AOMarker;
