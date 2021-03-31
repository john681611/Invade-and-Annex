params ["_AOMarker", "_faction"]; 


private _veh = [_AOMarker,"Box_FIA_Ammo_F"] call IA_fnc_spawnVehicle;
[getMarkerPos _AOMarker, ((getMarkerSize _AOMarker) select 0), [_veh]] call IA_fnc_hideInBuilding;
private _spawnedUnits = [_veh];

private _group = [_AOMarker,([_faction, "mainGroup"] call IA_fnc_getUnits)] call IA_fnc_spawnGroup;
		[_group, getPos _veh , 50, 3, 0.25, 0.5, true] call CBAEXT_fnc_taskDefend;
		{
			_spawnedUnits pushBack _x;
		} forEach (units _group);
[_spawnedUnits] remoteExec ["IA_fnc_addToAllCurators", 2];
[west, [format["%1-cache",_AOMark], format["%1-main",_AOMark]], ["Detroy Ammo Cache", "Destroy cache"], (getPos _veh) ,1, 2, true, "destroy"] call BIS_fnc_taskCreate;



waitUntil { sleep 5;  !alive _veh};
"Bo_GBU12_LGB" createVehicle getPos _veh;

[format["%1-cache",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;

_spawnedIntel