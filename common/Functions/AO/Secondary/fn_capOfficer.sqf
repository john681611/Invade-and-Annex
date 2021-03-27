params ["_AOMarker", "_faction"]; 


private _veh = [_AOMarker,([_faction, "officer"] call IA_fnc_getUnits)] call IA_fnc_spawnUnit;
removeallweapons _veh;
_veh setcaptive true;
_veh addAction ["Capture", "(_this select 0) switchmove """"; (_this select 0) enableAI ""all""; [(_this select 0)] join group player;"];

[getMarkerPos _AOMarker, ((getMarkerSize _AOMarker) select 0), [_veh]] call IA_fnc_hideInBuilding;
private _spawnedUnits = [_veh];

private _group = [_AOMarker,([_faction, "mainGroup"] call IA_fnc_getUnits)] call IA_fnc_spawnGroup;
		[_group, getPos _veh , 50, 3, 0.25, 0.5, true] call CBAEXT_fnc_taskDefend;
		{
			_spawnedUnits pushBack _x;
		} forEach (units _group);
[_spawnedUnits] remoteExec ["IA_fnc_addToAllCurators", 2];

[west, [format["%1-capOfficer",_AOMark], format["%1-main",_AOMark]], ["Capture Officer", "Capture Officer"], (getPos _veh) ,1, 2, true, "whiteboard"] call BIS_fnc_taskCreate;

waitUntil { sleep 5;  _veh distance (getMarkerPos _AOMarker) > 1000 || !alive _veh};

if(!alive _veh) then {
	[format["%1-capOfficer",_AOMark],"FAILED"] call BIS_fnc_taskSetState;
} else {
	[format["%1-capOfficer",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;
};
deleteVehicle _veh;

