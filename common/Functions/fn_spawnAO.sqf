params ["_AOMarker","_AOConfig"];
private _faction = "OPF_F";
private _spawnedUnits = [];

for "_i" from 1 to (_AOConfig get "mainGroup") do {
	private _group = [_AOMarker,([_faction, "mainGroup"] call IA_fnc_getUnits)] call IA_fnc_spawnGroup;
	[_group, (getMarkerPos _AOMarker), ((getMarkerSize _AOMarker) select 0)] call CBAEXT_fnc_taskDefend;
	{
        _spawnedUnits pushBack _x;
    } forEach (units _group);
};

for "_i" from 1 to (_AOConfig get "Car") do {
	private _veh = [_AOMarker,([_faction, "Car"] call IA_fnc_getUnits)] call IA_fnc_spawnVehicle;
	_spawnedUnits pushBack _veh;
	{
		_spawnedUnits pushBack _x;
	 } forEach (crew _veh);
};

for "_i" from 1 to (_AOConfig get "turret") do {
	private _veh = [_AOMarker,([_faction, "turret"] call IA_fnc_getUnits)] call IA_fnc_spawnVehicle;
		_spawnedUnits pushBack _veh;
	{
		_spawnedUnits pushBack _x;
	 } forEach (crew _veh);
};


[_spawnedUnits] remoteExec ["IA_fnc_addToAllCurators", 2];