params ["_AOMarker", "_faction"]; 

private _spawnedUnits = [];
private _AOpos = getMarkerPos _AOMarker;
private _radiusSize = (getMarkerSize _AOMarker) select 0;
private _randomPos = [_AOpos, 0, _radiusSize, 5, 0, 0.4, 0, [], _AOpos] call BIS_fnc_findSafePos;
private _veh = createMine ["APERSMine", _randomPos, [], 0]; //TODO repeate and position
_spawnedUnits = [getpos _veh, random 360, call COMP_fnc_minefield] call BIS_fnc_ObjectsMapper;
_spawnedUnits pushBack _veh;
[_spawnedUnits] remoteExec ["IA_fnc_addToAllCurators", 2];

[west, [format["%1-mines",_AOMark], format["%1-main",_AOMark]], ["Clear Minefield before a civie gets hurt", "Clear Minefield"], (getPos _veh) ,1, 2, true, "mine"] call BIS_fnc_taskCreate;

waitUntil { sleep 5;  !alive _veh}; //TODO Check none left

[format["%1-mines",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;
