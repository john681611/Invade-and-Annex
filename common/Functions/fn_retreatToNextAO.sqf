params ["_units", "_AOMarker"];
private _AOPos = getMarkerPos _AOMarker;

//delete units if over 500 on map already or if new AO is over 3k away;
if({ alive _x && (side _x) == east } count allUnits > 500) then {
	{
		deleteVehicle _x;
	} forEach _units;
	_units = [];
};

private _survivors = [];
{
	if(alive _x) then {
		if((_AOPos distance _x) > 3000) then {
			deleteVehicle _x;
		} else {
			_survivors pushBack _x;
		};
	} else {
		[_x] join grpNull;
	};
	
} forEach _units;
[_survivors] remoteExec ["IA_fnc_removeToAllCurators", 2];
sleep 2;
private _directed_groups = [];
{
		private _group = (group _x);
		if (!( _group in _directed_groups)) then {
			private _waypoints = waypoints _group;
			{
				deleteWaypoint [_group, 0];
			} forEach _waypoints;
			{
				_x enableAI "PATH";
				_x doMove  (getpos (leader _group));
			} forEach units _group;
			systemChat format["%1",_group];
			private _waypoint = _group addWaypoint [_AOPos, 50];
			_waypoint setWaypointType "MOVE";
			_waypoint setWaypointBehaviour "CARELESS";
			_waypoint setWaypointSpeed "FULL";
			// _waypoint setWaypointStatements ["TRUE", _onComplete];
			_directed_groups pushBack _group;
		};
	
} forEach _survivors;
sleep 2;
[_survivors] remoteExec ["IA_fnc_addToAllCurators", 2];

_survivors;



