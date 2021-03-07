params ["_AOMarker", "_faction"]; 

//TODO Task Create


private _spawnedUnits = [];
private _veh = [_AOMarker,([_faction, "officer"] call IA_fnc_getUnits)] call IA_fnc_spawnUnit;
[[_veh]] remoteExec ["IA_fnc_addToAllCurators", 2];

waitUntil { sleep 10;  !alive _veh};

//TODO Task Complete