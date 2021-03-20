params ["_AOMarker","_AOConfig", "_faction"];
private _spawnedUnits = [];
private _AOPos = getMarkerPos _AOMarker;
private _AORad = ((getMarkerSize _AOMarker) select 0) - 100;


{
	for "_i" from 1 to (_AOConfig getOrDefault [_X, 0]) do {
		private _group = [_AOMarker,([_faction, _X] call IA_fnc_getUnits)] call IA_fnc_spawnGroup;
		[_group, _AOPos , _AORad, 3, 0.1, 0.1, true] call CBAEXT_fnc_taskDefend;
		{
			_spawnedUnits pushBack _x;
		} forEach (units _group);
	};
} forEach ["mainGroup","reconGroup"];

{
	for "_i" from 1 to (_AOConfig getOrDefault [_x, 0]) do {
		private _group = [_AOMarker,([_faction, _x] call IA_fnc_getUnits)] call IA_fnc_spawnGroup;
		[_group, _AOPos , _AORad] call CBAEXT_fnc_taskPatrol;
		{
			_spawnedUnits pushBack _x;
		} forEach (units _group);
	};
} forEach ["ATGroup","AAGroup"];

{
	for "_i" from 1 to (_AOConfig getOrDefault [_x, 0]) do {
		private _veh = [_AOMarker,([_faction, _x] call IA_fnc_getUnits)] call IA_fnc_spawnVehicle;
		[group _veh,  _AOPos , _AORad, 5, "sad", "safe", "red", "limited"] call CBAEXT_fnc_taskPatrol;
		_spawnedUnits pushBack _veh;
		{
			_spawnedUnits pushBack _x;
		} forEach (crew _veh);
	};
} forEach ["Car","MBT", "IFV", "AAA"];

for "_i" from 1 to (_AOConfig getOrDefault ["turret", 0]) do {
	private _veh = [_AOMarker,([_faction, "turret"] call IA_fnc_getUnits)] call IA_fnc_spawnVehicle;
		_spawnedUnits pushBack _veh;
	{
		_spawnedUnits pushBack _x;
	 } forEach (crew _veh);
};

//Boats

//TODO Helicopters and Jets


[_spawnedUnits] remoteExec ["IA_fnc_addToAllCurators", 2];

_spawnedUnits;