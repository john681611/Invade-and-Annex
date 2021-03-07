private _selectedTownMarker = "";
while {_selectedTownMarker == ""} do {
	private _candiateTown = selectRandom ztownAll;
	if(getMarkerColor _candiateTown == "ColorYellow") then {
		_selectedTownMarker = _candiateTown;
	};
};
_selectedTownMarker setMarkerAlpha 0.5;
_selectedTownMarker setMarkerColor "colorRed";
_selectedTownMarker;