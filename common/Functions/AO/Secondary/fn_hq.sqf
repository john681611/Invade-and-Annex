params ["_AOMarker", "_faction"]; 


private _spawnedUnits = [];
private _veh = [_AOMarker, selectRandom ["Land_Cargo_HQ_V3_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V4_F"]] call IA_fnc_spawnUnit;
//TODO Add intel to find in the in the in
//Defense Forces 
[[_veh]] remoteExec ["IA_fnc_addToAllCurators", 2];

[west, [format["%1-hq",_AOMark], format["%1-main",_AOMark]], ["Gather Intel from HQ", "Gather Intel"], (getPos _veh) ,1, 2, true, "search"] call BIS_fnc_taskCreate;

waitUntil { sleep 5;  !alive _veh};

[format["%1-hq",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;
