params ["_AOMarker", "_faction"]; 


private _spawnedUnits = [];
private _veh = [_AOMarker, selectRandom ["Land_Device_slingloadable_F","Land_Device_assembled_F","O_Truck_03_device_F","O_T_Truck_03_device_ghex_F"]] call IA_fnc_spawnVehicle;
[[_veh]] remoteExec ["IA_fnc_addToAllCurators", 2];

[west, [format["%1-ewd",_AOMark], format["%1-main",_AOMark]], ["Destroy East Wind Device", "Destroy EWD"], (getPos _veh) ,1, 2, true, "destroy"] call BIS_fnc_taskCreate;

[2] remoteExec ["BIS_fnc_earthquake"];

waitUntil { sleep 5;  !alive _veh};

[format["%1-ewd",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;
