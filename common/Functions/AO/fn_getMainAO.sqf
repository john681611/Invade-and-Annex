
private _selectedTownMarker = "";
private _remainingTowns = (ztownAll) select {!(_x in takenTowns)};
if(count _remainingTowns == 0) exitWith {
	"EveryoneWon" call BIS_fnc_endMissionServer;
	[] call IA_fnc_clearState;
};
if(count takenTowns > 0) then {
	_remainingTowns =  [_remainingTowns, [], { (getMarkerPos (takenTowns select ((count takenTowns) -1))) distance (getMarkerPos _x) }, "ASCEND"] call BIS_fnc_sortBy;
} else {
	_remainingTowns =  [_remainingTowns, [], { (getMarkerPos "respawn_west") distance (getMarkerPos _x) }, "ASCEND"] call BIS_fnc_sortBy;
};
while {_selectedTownMarker == ""} do {
	private _candiateTown = selectRandom (_remainingTowns select [0, 3]);
	if(getMarkerColor _candiateTown == "ColorYellow") then {
		_selectedTownMarker = _candiateTown;
	};
};
_selectedTownMarker setMarkerAlpha 0.5;
_selectedTownMarker setMarkerColor "colorRed";
_selectedTownMarker;