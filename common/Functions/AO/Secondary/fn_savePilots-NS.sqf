params ["_AOMarker", "_faction"]; 


private _spawnedUnits = [];
private _veh = [_AOMarker,"Box_FIA_Ammo_F"] call IA_fnc_spawnUnit;
[[_veh]] remoteExec ["IA_fnc_addToAllCurators", 2];

[west, [format["%1-cache",_AOMark], format["%1-main",_AOMark]], ["Detroy Ammo Cache", "Destroy cache"], (getPos _veh) ,1, 2, true, "destroy"] call BIS_fnc_taskCreate;


//TODO: Move to Building & Spawn defensive team;

waitUntil { sleep 5;  !alive _veh};

[format["%1-cache",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;
