private _AOMark = [] call IA_fnc_getSideAO;
private _faction = "OPF_F";
//TODO SEE if as laggy on server
//[SideTable, _AOMark, 30, 0.95, true] spawn BT_fnc_createTable;
[west, [format["%1-main",_AOMark]], ["Special Mission", "Special Mission"], (getMarkerPos _AOMark) ,1, 2, true, "attack"] call BIS_fnc_taskCreate;
private _forceConfig = [] call IA_fnc_getSideAOForceConfig;
private _spawnedUnits = [_AOMark, _forceConfig, _faction] call IA_fnc_spawnForce;
_spawnedUnits = _spawnedUnits + ([_AOMark, _faction] call (selectRandom sideMissions));

[format["%1-main",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;
sleep 300;
{
	deleteVehicle _x;
} forEach _spawnedUnits;
deleteMarker _AOMark;
[] spawn IA_fnc_newSideAO;