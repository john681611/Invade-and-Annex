private _selectedTownMarker = "";
private _AOpos = getMarkerPos (selectRandom ztownAll);
private _randomPos = [_AOpos, 100, 2000, 5, 0, 0.4, 0, [], _AOpos] call BIS_fnc_findSafePos;

_m = createMarker [format["%1=sideMarker",_AOpos],_randomPos];

_m setMarkerShape "ELLIPSE";
_m setMarkerBrush "Cross";
_m setMarkerAlpha 0.8;
_m setMarkerColor "ColorRed";
_m setMarkerSize [200,200];

_m;
