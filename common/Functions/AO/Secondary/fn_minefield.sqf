params ["_AOMarker", "_faction"]; 

private _spawnedUnits = [];
private _mines = [];
private _mineOptions = ["APERSBoundingMine",
	"APERSMine",
	"APERSMineDispenser_Mine_F",
	"APERSTripMine",
	"ATMine",
	"SLAMDirectionalMine"];
private _AOpos = getMarkerPos _AOMarker;
private _radiusSize = (getMarkerSize _AOMarker) select 0;
private _randomPos = [_AOpos, 0, _radiusSize, 5, 0, 0.4, 0, [], _AOpos] call BIS_fnc_findSafePos;
private _veh = createMine [_mineOptions selectRandom, _randomPos, [], 0];
_spawnedUnits = [getpos _veh, random 360, call COMP_fnc_minefield] call BIS_fnc_ObjectsMapper;
_spawnedUnits pushBack _veh;
_mines pushBack _veh;

for "_i" from 1 to (random 10) do {
	private _randomMinePos = [getPos _veh, 0, 25, 5, 0, 0.4, 0, [], _AOpos] call BIS_fnc_findSafePos;
	private _mine = createMine [_mineOptions selectRandom, _randomMinePos, [], 0];
	_mines pushBack _mine;
	_spawnedUnits pushBack _mine;
};
[_spawnedUnits] remoteExec ["IA_fnc_addToAllCurators", 2];

[west, [format["%1-mines",_AOMark], format["%1-main",_AOMark]], ["Clear Minefield before a civie gets hurt", "Clear Minefield"], (getPos _veh) ,1, 2, true, "mine"] call BIS_fnc_taskCreate;

waitUntil { sleep 5; {alive _x} count _mines == 0};

[format["%1-mines",_AOMark],"SUCCEEDED"] call BIS_fnc_taskSetState;
