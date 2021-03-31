params ["_AOMarker", "_faction"]; 


private _spawnedUnits = [];
private _veh = [_AOMarker, selectRandom ["Land_Communication_F","Land_TTowerBig_1_F","Land_TTowerBig_2_F"]] call IA_fnc_spawnVehicle;
[[_veh]] remoteExec ["IA_fnc_addToAllCurators", 2];

[west, [format["%1-tower",_AOMark], format["%1-main",_AOMark]], ["Detroy Comms Tower", "Destroy Comms Tower"], (getPos _veh) ,1, 2, true, "destroy"] call BIS_fnc_taskCreate;

//TODO Renforcements?
waitUntil { sleep 5;  !alive _veh};

[format["%1-tower",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;

_spawnedUnits
