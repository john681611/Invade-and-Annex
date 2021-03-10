params ["_AOMarker","_AOConfig", "_faction"];
private _spawnedUnits = [];
private _AOPos = getMarkerPos _AOMarker;
private _AORad = (getMarkerSize _AOMarker) select 0;

for "_i" from 1 to (_AOConfig get "mainGroup") do {
	private _group = [_AOMarker,([_faction, "mainGroup"] call IA_fnc_getUnits)] call IA_fnc_spawnGroup;
	[_group, _AOPos , _AORad] call CBAEXT_fnc_taskDefend;
	{
        _spawnedUnits pushBack _x;
    } forEach (units _group);
};

for "_i" from 1 to (_AOConfig get "Car") do {
	private _veh = [_AOMarker,([_faction, "Car"] call IA_fnc_getUnits)] call IA_fnc_spawnVehicle;
	[group _veh,  _AOPos , _AORad, 5, "sad", "safe", "red", "limited"] call CBAEXT_fnc_taskPatrol;
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